#!/bin/bash

stdTestFile="/tmp/std_printf_speed_test_tmp_file.txt"
ftTestFile="/tmp/ft_printf_speed_test_tmp_file.txt"
jobs=()
trap 'if [[ ! -z "${jobs[@]}" ]]; then kill ${jobs[@]} &>/dev/null; fi; rm -rf "$stdTestFile" "$ftTestFile"; exit 130' EXIT HUP TERM INT

echo "Test de la vitesse du std printf."
rm -rf "$stdTestFile"
./std_printf_speed > "$stdTestFile" & jobs+=($!); sleep 10; kill -9 $!; wait $! 2>/dev/null

echo "Test de la vitesse du ft printf."
rm -rf "$ftTestFile"
./ft_printf_speed > "$ftTestFile" & jobs+=($!); sleep 10; kill -9 $!; wait $! 2>/dev/null

echo "Resultat du std printf : $(cat "$stdTestFile" | wc -l | tr -d ' \r\n\t')"
echo "Resultat du ft printf  : $(cat "$ftTestFile" | wc -l | tr -d ' \r\n\t')"
rm -rf "$stdTestFile"
rm -rf "$ftTestFile"
