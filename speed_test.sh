#!/bin/bash

baseTestFile="/tmp/printf_speed_test_tmp_file.txt."
printfExecLst=()
printfResultLst=()

jobsId=()
trap 'if [[ ! -z "${jobsId[@]}" ]]; then kill ${jobsId[@]} &>/dev/null; fi; rm -rf "$baseTestFile"*; exit 130' EXIT HUP TERM INT

for param in "$@"; do
	nbOfColonInParam="$(echo -n "$param" | tr -dc ':' | wc -c | tr -d $' \r\n\t')"
	if [[ "$nbOfColonInParam" == "0" ]]; then
		printfExecLst+=("$param")
	else
		echo "Erreur, parametre « $param » invalide."
		exit 0
	fi
done

nbOfExec="${#printfExecLst[@]}"
nameMaxSize="0"
resultMaxSize="0"

if [[ "$nbOfExec" == "0" ]]; then
	echo "Erreur, aucun printf a tester."
	exit 0
fi

idx="0"
while [[ "$idx" != "$nbOfExec" ]]; do
	param="${printfExecLst[$idx]}"

	if [[ "${#param}" -gt "$nameMaxSize" ]]; then
		nameMaxSize="${#param}"
	fi
	echo "Test de la vitesse de ${param}."
	rm -rf "${baseTestFile}${idx}"
	./"${param}" > "${baseTestFile}${idx}" & jobsId+=($!); sleep 10; kill -9 $!; wait $! 2>/dev/null

	(( ++idx ))
done

echo "Calcul des resultats..."

idx="0"
while [[ "$idx" != "$nbOfExec" ]]; do
	tmpResult="$(cat "${baseTestFile}${idx}" | wc -l | tr -d $' \r\n\t')"

	if [[ "${#tmpResult}" -gt "$resultMaxSize" ]]; then
		resultMaxSize="${#tmpResult}"
	fi
	printfResultLst+=("$tmpResult")
	rm -rf "${baseTestFile}${idx}"

	(( ++idx ))
done

idx="0"
while [[ "$idx" != "$nbOfExec" ]]; do
	curExecName="${printfExecLst[$idx]}"
	curExecResult="${printfResultLst[$idx]}"

	printf 'Resultat de %-*s : %*s\n' "$nameMaxSize" "$curExecName" "$resultMaxSize" "$curExecResult"

	(( ++idx ))
done
