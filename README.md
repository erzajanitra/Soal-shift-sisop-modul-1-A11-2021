# Penjelasan dan Penyelesaian Soal Shift Modul 1

## No. 1

## No. 2
### 2a
Steven ingin mengapresiasi kinerja karyawannya selama ini dengan mengetahui *Row ID* dan *Profit Percentage* terbesar (jika hasil profit percentage terbesar lebih dari 1, maka ambil Row ID yang paling besar). Karena kamu bingung, Clemong memberikan definisi dari profit percentage, yaitu:
``Profit Percentage = (Profit ÷ Cost Price) × 100``
Cost Price didapatkan dari pengurangan Sales dengan Profit. (Quantity diabaikan).
* Mencari nilai ``Profit Percentage``
  ```soal2_generate_laporan_ihir_shisop.sh
     pp=($21/($18-$21))*100
  ```
  Berdasarkan rumus untuk mencari Profit Percentage yang telah diberikan, value dari kolom Profit didapatkan dengan menggunakan $21. Sementara itu, untuk mendapatkan Cost Price yaitu dengan mengurangi Sales yang didapatkan dengan $18 dan Profit yang didapatkan dengan $21. Kemudian hasil pembagian dari Profit dan Cost Price dikalikan dengan 100.
* Mendapatkan nilai ``Profit Percentage`` terbesar
  ```soal2_generate_laporan_ihir_shisop.sh
     if(pp>=max){
        max=pp
        id=$1
     }
  ```
    Membandingkan *Profit Percentage* yang dituliskan dengan variabel *pp* dengan suatu variabel *max* untuk menyimpan nilai terbesar. Apabila nilai *pp* lebih besar dibandingkan dengan nilai *max* maka *Profit Percentage* terbesar akan disimpan di variabel *max*. Kemudian, ``id=$1`` digunakan untuk menyimpan *Row ID* paling besar.
 * Menampilkan ``Row ID`` dan ``Profit Percentage``
  ```soal2_generate_laporan_ihir_shisop.sh
     printf("Transaksi terakhir dengan profit percentage terbesar yaitu %d dengan persentase %.2f%%",id,max)
  ```
    Menampilkan *Row ID* dan *Profit Percentage* terbesar dengan variabel *id* dan *max*
    

## No. 3
