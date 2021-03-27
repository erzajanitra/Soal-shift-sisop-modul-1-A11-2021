#!/bin/bash

#password zip pakai tanggal
password=$(date +"%m%d%Y")

#zip file + password
zip -P $password -mr Koleksi.zip $(ls | grep -E "Kelinci_|Kucing")