#!/bin/bash
awk '
BEGIN	{
    FS="\t"
}

#no 2a
{
    pp=($21/($18-$21))*100
    #cari max pp
    if (pp>=max){
        max=pp
        id=$1
    }
   
    #if max pp>1 cari row ID paling besar
}

#no2b
{
    if($2~"2017" && $10=="Albuquerque"){

        nama[$7]++
        
    }

}

#no2c
{
      
    #hitung berapa kali tiap segment
    if ($8=="Home Office") {
         sc1+=1
    }
    else if ($8=="Consumer") {
         sc2+=1
    }
    else if ($8=="Corporate") {
         sc3+=1
    }

       

}

#no2d
{
    if ($13=="Central" || $13=="East" || $13=="South" || $13=="West"){
        #jumlah semua profit
        reg[$13]+=$21
    }
}

END{
#soal2a
    printf("Transaksi terakhir dengan profit percentage terbesar yaitu %d dengan persentase %.2f%%\n", id,max)

printf("\n\n")
#soal2b
    printf("Daftar nama customer di Albuquerque pada tahun 2017 antara lain :\n")
    for(i in nama){
        printf("%s\n", i)
    }
printf("\n\n")
#soal2c
#print yang paling sedikit
    if(sc1<sc2 && sc1<sc3){
        printf("Tipe segmen customer yang penjualannya paling sedikit adalah Home Office dengan %d transaksi\n", sc1)
    }
    else if(sc2<sc1 && sc2<sc3){
        printf("Tipe segmen customer yang penjualannya paling sedikit adalah Consumer dengan %d transaksi\n", sc2)
    }
    else if(sc3<sc1 && sc3<sc2){
        printf("Tipe segmen customer yang penjualannya paling sedikit adalah Corporate dengan %d transaksi\n", sc3)
    }
printf("\n\n")
#soal2d
profit=99999999
for(i in reg){
    if(profit>reg[i]){
        profit=reg[i]
        nama_reg=i
    }
}
printf("Wilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %.2f\n", nama_reg,profit)
printf("\n")
}
' /home/erzajanitra/Downloads/Laporan-TokoShiSop.tsv > hasil.txt
