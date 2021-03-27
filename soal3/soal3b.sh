#!/bin/bash

#pindah ke folder berdasarkan tanggal download
cd /home/erzajanitra/shift1soal3

#nama dir
fotoKucing="$(date +%d)-%(date +%m)-$(date +%Y)"
mkdir $fotoKucing

#pindahin Foto.log & foto kucing
bash /home/erzajanitra/shift1soal3/soal3a.sh
mv *.jpg $fotoKucing
mv Foto.log $fotoKucing