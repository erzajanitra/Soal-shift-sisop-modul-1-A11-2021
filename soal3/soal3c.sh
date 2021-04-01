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
for i in K*_*
    do
    
        [[ -f "${i}" ]] || continue

        read cksm _  < <(md5sum "$i")
        if ((koleksi_foto[$cksm]++))
            then rm $i
        fi
    
    done

#rename nama
j=1
for i in {1..23} 
    do
    if [ -f Koleksi_$i.jpg ] 
    then
        if [ $i -lt 10 ]
        then
        mv Koleksi_$i.jpg Koleksi_0$j.jpg
        j=$[$j+1]
        else
        mv Koleksi_$i.jpg Koleksi_$j.jpg
        j=$[$j+1]
        fi
    
    fi
    
done
tanggal="$(date +%d%m%Y)"
mkdir $"Kucing_$tanggal"

#pindahin Foto.log & foto kucing

mv *.jpg $"Kucing_$tanggal"
mv Foto.log $"Kucing_$tanggal"
}


kelinciF(){
#download gambar
for i in {1..23}
    do 
    wget -a Foto.log "https://loremflickr.com/320/240/bunny" -O "Koleksi_$i.jpg"
    done


declare -A koleksi_foto
shopt -s globstar
for i in K*_*
    do
    
        [[ -f "${i}" ]] || continue

        read cksm _  < <(md5sum "$i")
        if ((koleksi_foto[$cksm]++))
            then rm $i
        fi
    
    done

#rename nama
j=1
for i in {1..23} 
    do
    if [ -f Koleksi_$i.jpg ] 
    then
        if [ $i -lt 10 ]
        then
        mv Koleksi_$i.jpg Koleksi_0$j.jpg
        j=$[$j+1]
        else
        mv Koleksi_$i.jpg Koleksi_$j.jpg
        j=$[$j+1]
        fi
    
    fi
    
done

#pindah ke file
tanggal="$(date +%d%m%Y)"
mkdir $"Kelinci_$tanggal"

#pindahin Foto.log & foto kucing

mv *.jpg $"Kelinci_$tanggal"
mv Foto.log $"Kelinci_$tanggal"
}

#download gambar bergantian
dates=$(date +%e)
#kalo tanggal genap-kucing, ganjil-kelinci

if [ $(($dates%2)) -eq 0 ]
    then kucingF
else kelinciF
fi

