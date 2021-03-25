#!/bin/bash

#no 1a
file='syslog.log'

error=$(cat $file | grep 'ERROR')
info=$(cat $file | grep 'INFO')

jumlah_error=$(grep -c 'ERROR' $file)
jumlah_info=$(grep -c 'INFO' $file)

#echo $error
#echo $info
#echo $jumlah_error
#echo $jumlah_info

#no 1b

pesan=$(echo "$error" | grep -Po '(?<=ERROR\s)(.*)(?= )')
hitung_pesan=$(echo "$pesan" | sort | uniq -c )
#echo $pesan
#echo $hitung_pesan

#no 1c
user=$(cat $file | grep -Po '(?<=\()(.*)(?=\))' | sort -u)
#echo $user
#hitung error dan info di 1e

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
for i in $user
do
err_count=$(cat $file | grep 'ERROR' | grep -c $i)
info_count=$(cat $file | grep 'INFO' | grep -c $i)
echo "$i,$info_count,$err_count" >> user_statistic.csv
done
