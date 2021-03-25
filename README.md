# Penjelasan dan Penyelesaian Soal Shift Modul 1

## No. 1

## No. 2
Mencari beberapa kesimpulan dari data penjualan ``Laporan-TokoShiSop.tsv`` yang akan dijelaskan pada no *2a, 2b, 2c, dan 2d*. Soal *2a, 2b, 2c, dan 2d* dikerjakan pada script ``soal2_generate_laporan_ihi_shisop.sh``. Hasil pengerjaan soal tersebut ditampilkan pada ``hasil.txt``.
* Import awk
``` #!/bin/bash
    awk '
```
 Untuk mengerjakan soal ini kami menggunakan ``awk`` sehingga pada awal ``shell script`` harus mengimport ``awk`` terlebih dahulu.
 * Field Separator
 ```
    BEGIN	{
    FS="\t"
    }
 ```
 Karena pada file ``Laporan-TokoShiSop.tsv`` tiap kolom dipisahkan dengan *tab* maka menggunakan *FS="\t"*

### Blok BEGIN
### 2a
**Soal**: Steven ingin mengapresiasi kinerja karyawannya selama ini dengan mengetahui **Row ID** dan **Profit Percentage** terbesar (jika hasil profit percentage terbesar lebih dari 1, maka ambil Row ID yang paling besar). Karena kamu bingung, Clemong memberikan definisi dari profit percentage, yaitu:
``Profit Percentage = (Profit ÷ Cost Price) × 100``
Cost Price didapatkan dari pengurangan Sales dengan Profit. (Quantity diabaikan).
* Mencari nilai ``Profit Percentage``
  ```soal2_generate_laporan_ihir_shisop.sh
     pp=($21/($18-$21))*100
  ```
  Berdasarkan rumus untuk mencari **Profit Percentage** yang telah diberikan, value dari kolom **Profit** didapatkan dengan menggunakan **$21**. Sementara itu, untuk mendapatkan **Cost Price** yaitu dengan mengurangi *Sales* yang didapatkan dengan **$18** dan *Profit* yang didapatkan dengan **$21**. Kemudian hasil pembagian dari *Profit* dan *Cost Price* dikalikan dengan 100.
* Mendapatkan nilai ``Profit Percentage`` terbesar
  ```soal2_generate_laporan_ihir_shisop.sh
     if(pp>=max){
        max=pp
        id=$1
     }
  ```
    Membandingkan **Profit Percentage** yang dituliskan dengan variabel *pp* dengan suatu variabel *max* untuk menyimpan nilai terbesar. Apabila nilai *pp* lebih besar dibandingkan dengan nilai *max* maka *Profit Percentage* terbesar akan disimpan di variabel *max*. Kemudian, ``id=$1`` digunakan untuk menyimpan *Row ID* paling besar.
### 2b
**Soal**: Clemong memiliki rencana promosi di Albuquerque menggunakan metode MLM. Oleh karena itu, Clemong membutuhkan daftar *nama customer* pada transaksi tahun 2017 di Albuquerque.
* Mendapatkan ``nama customer`` 
  ```soal2_generate_laporan_ihir_shisop.sh
      if($2~"2017" && $10=="Albuquerque"){
        nama[$7]++
     }
  ```
  Menggunakan *if condition* untuk mengecek apakah customer tersebut melakukan transaksi tahun 2017 di Albuquerque. Untuk mendapatkan angka berupa string 2017 dari kolom ``Order ID`` menggunakan **$2~"2017"**. Kemudian mengecek apakah customer tersebut melakukan transaksi di Albuquerque dari kolom ``City``dengan **$10=="Albuquerque"**. Setelah itu, nama customer akan disimpan di sebuah array ``nama[$7]++`` dengan **$7** adalah kolom ``Customer Name``. Maka nama customer yang memenuhi *if condition* akan tersimpan di array ``nama[Albuquerque]``.
### 2c
**Soal**: TokoShiSop berfokus tiga segment customer, antara lain: **Home Office**, **Consumer**, dan **Corporate**. Clemong ingin meningkatkan penjualan pada segmen customer yang paling sedikit. Oleh karena itu, Clemong membutuhkan segment customer dan jumlah transaksinya yang paling sedikit.
* Menghitung jumlah transaksi masing-masing segment customer
  ```soal2_generate_laporan_ihir_shisop.sh
      if ($8=="Home Office") {
         sc1+=1
      }
      else if ($8=="Consumer") {
         sc2+=1
      }
      else if ($8=="Corporate") {
         sc3+=1
      }
  ```
Menggunakan *if-else condition* untuk menghitung jumlah transaksi masing-masing segment. Segment customer berada pada kolom ``Segment`` yang bisa dituliskan dengan **$8**. Untuk menghitung menggunakan counter, yaitu *sc1* untuk **Home Office**, *sc2* untuk **Consumer**, dan *sc2* untuk **Corporate**. Counter akan bertambah apabila kondisi yang sedang dicek memenuhi salah satu syarat tersebut. Kemudian, untuk mencari nilai terkecilnya akan dijelaskan pada bagian ``Blok END`` **2c**
### 2d
**Soal**: TokoShiSop membagi wilayah bagian (region) penjualan menjadi empat bagian, antara lain: **Central, East, South, dan West**. Manis ingin mencari wilayah bagian
(region) yang memiliki **total keuntungan (profit) paling sedikit** dan **total keuntungan wilayah** tersebut.
* Menghitung total keuntungan masing-masing wilayah bagian (region)
  ```soal2_generate_laporan_ihir_shisop.sh
     if ($13=="Central" || $13=="East" || $13=="South" || $13=="West"){
        #jumlah semua profit
        reg[$13]+=$21
    }
  ```
  Menggunakan *if condition* untuk mengecek string **Central, East, South, dan West** pada kolom ``Region`` yang dituliskan dengan **$13**. Total keuntungan masing-masing region disimpan pada array *reg*. ``reg[$13]+=$21`` artinya *Profit* yang dituliskan dengan **$21** akan dijumlahkan untuk salah satu region. Kemudian, untuk mencari nilai terkecilnya akan dijelaskan pada bagian ``Blok END`` **2d**
 
### Blok END
Pada *awk*, semua fungsi *printf* dimasukkan pada blok ``END``.
* Menampilkan ``Row ID`` dan ``Profit Percentage`` dari soal **2a**
  ```soal2_generate_laporan_ihir_shisop.sh
     printf("Transaksi terakhir dengan profit percentage terbesar yaitu %d dengan persentase %.2f%%",id,max)
  ```
  Menampilkan **Row Id** dan **Profit Percentage** yang telah didapatkan dengan variabel *id* dan *max*. 
* Menampilkan ``nama customer``  dari soal **2b**
  ```soal2_generate_laporan_ihir_shisop.sh
      printf("Daftar nama customer di Albuquerque pada tahun 2017 antara lain :\n")
      for(i in nama){
        printf("%s\n", i)
     }
  ```
    Iterasi semua nilai pada array ``nama`` untuk menampilkan semua nama pada array tersebut. 

## No. 3
