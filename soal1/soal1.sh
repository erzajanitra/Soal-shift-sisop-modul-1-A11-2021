#!/bin/bash

#no 1a
file='syslog.log'

error=$(cat $file | grep 'ERROR')
info=$(cat $file | grep 'INFO')

echo "$error" | while read row;
do
status=$(echo $row | grep -oP 'INFO|ERROR')
message=$(echo $row | grep -oP '(?<=[ERROR|INFO]\s)(.*)(?<=[a-z] )')
username=$(echo $row | grep -oP '(?<=\()(.*)(?=\))')
ec="$status,$message,$username"
echo $ec
done

echo "$info" | while read row;
do
status=$(echo $row | grep -oP 'INFO|ERROR')
message=$(echo $row | grep -oP '(?<=[ERROR|INFO]\s)(.*)(?<=[a-z] )')
username=$(echo $row | grep -oP '(?<=\()(.*)(?=\))')
ec="$status,$message,$username"
echo $ec
done


#no 1b
pesan=$(echo "$error" | grep -Po '(?<=ERROR\s)(.*)(?<=[a-z] )')
hitung_pesan=$(echo "$pesan" | sort | uniq -c | sort -nr)

#echo $pesan
#echo $hitung_pesan

#no 1c
user=$(cat $file | grep -Po '(?<=\()(.*)(?=\V)' | sort | uniq)

for line in $user;
do
err_count=$(cat $file | grep 'ERROR' | grep -wc $line )
info_count=$(cat $file | grep 'INFO' | grep -wc $line )
echo "$line,$info_count,$err_count"
done

#no 1d
echo 'Error,Count' > error_message.csv
echo "$hitung_pesan" | while read row;
do
error=$(echo $row | cut -d ' ' -f 2-)
count=$(echo $row | cut -d ' ' -f 1)
ec="$error,$count"
echo $ec >> error_message.csv
done

#no 1e
echo 'Username,INFO,ERROR' > user_statistic.csv
for row in $user;
do
err_count=$(cat $file | grep 'ERROR' | grep -wc $row )
info_count=$(cat $file | grep 'INFO' | grep -wc $row )
echo "$row,$info_count,$err_count" >> user_statistic.csv
done
