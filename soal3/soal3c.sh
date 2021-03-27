#!/bin/bash

kucingF(){
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

tanggal="$(date +%d%m%Y)"
mkdir "Kucing_$tanggal"

#pindahin Foto.log & foto kucing

mv *.jpg "Kucing_$tanggal"
mv Foto.log "Kucing_$tanggal"
}


kelinciF(){
#download gambar
for i in {1..23}
    do 
    wget -a Foto.log "https://loremflickr.com/320/240/bunny" -O "Koleksi_$i.jpg"
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

#pindah ke file
tanggal="$(date +%d%m%Y)"
mkdir "Kelinci_$tanggal"

#pindahin Foto.log & foto kucing

mv *.jpg "Kelinci_$tanggal"
mv Foto.log "Kelinci_$tanggal"
}

#download gambar bergantian
c1=$(ls | grep "Kelinci_" | wc -l)
c2=$(ls | grep "Kucing_" | wc -l)
if [[ $c1 -eq $c2 ]]
    then kucingF
elif [[ $c1 -ne $c2 ]]
    then kelinciF
fi