#!/bin/bash

#download gambar
for i in {1..23}
    do 
    wget -a Foto.log "https://loremflickr.com/320/240/kitten" -O "Koleksi_$i.jpg"
    done


#remove gambar yang sama
declare -A koleksi_foto
shopt -s globstar
for i in {1..23}
    do
    [[ -f "${i}" ]] || continue

    read cksm _ < <(md5sum "$i")
    if ((koleksi_foto[$cksm]++))
        then rm $i
    fi
    done

#rename nama
for i in {1..9}
    do mv "Koleksi_$i.jpg" "Koleksi_0$i.jpg"
    done
