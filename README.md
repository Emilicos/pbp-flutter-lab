# counter_7

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Tugas 7

### Soal
#### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.<br>
Stateless widget adalah widget yang tidak akan berubah seperti Icon, IconButton, dan text merupakan contoh stateless widget. Stateless widget merupakan subclass dari StatelessWidget. Stateful widget adalah widtet yang dinamis. Hal ini artinya, widget ini dapat melakukan perubahan ketika dilakukan aksi. 
Perbedaan utamanya adalah dalam perubahan. Apabila kita anggap, stateless adalah seperti const dan stateful seperti variable yang dapat berubah

#### 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya. <br>
Saya memakai widget Text untuk memperlihatkan text sesuai dengan kondisi yang saya taruh
Saya juga memakai widget stack untuk menggunakan position absolute. Stack sendiri berfungsi untuk override/memakai widget diatas widget yang lain. Saya juga memakai material app widgets yang berguna untuk membentuk beberapa widget yang berguna untuk aplikasi kita. Banyak juga widget yang saya gunakan seperti Icon widget, center widget, Positioned widget, padding widget dll. Widget-widget ini seperti namaya, untuk icon membuat icon, center untuk mencenter, positioned untuk mengatur posisi, padding untuk membuat padding. 

#### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut. <br>
Setstate ini berguna untuk memberi tahu bahwa apabila suatu variabel ada terjadi perubahan, maka akan berdampak kepada build ke flutter. Tanpa function ini, angka tersebut akan berubah namun flutter tidak akan melakukan build ulang untuk memperlihatkan perubahan dari state tersebut. Hal yang berdampak dengna fungsi tersebut adalah seluruh widgets yang merender nilai dari variabel yang berubah serta widgets yang digunakan supaya terlihat adanya perubahan.

#### 4. Jelaskan perbedaan antara const dengan final. <br>
Final dan const merupakan kedua hal yang sangat mirip dan memiliki fungsionalitas yang sama. Final sendiri artinya single-assignment dimana kita sudah memiliki nilai terakhir. Untuk const adalah nilai ynag terbentuk pada saat time kita compiling. Artinya apabila kita ingin menggunakan hasil yang terbentuk pada saat runtime seperti datetime.now() kita tidak dapat melakukan hal tersebut. Misal apabila kita ingin menggunakan const daripada final, kita melihat dulu nilai dari konstanta yang kita ingin masukkan. Seperti apabila a = 1, kita lebih baik menggunakan const. Namun apabila kita memiliki sebuah nilai yang didapat pada saat runtime tapi tidak akan berubah lagi seperti data dari API ataupun datetime.now(), kita lebih baik  menggunakan final. Final artinya nilai harus kita tahu pada saat run time. 

#### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas. <br>
1. Saya membuat aplikasi flutter
2. Saya mengganti tulisan di navbar
3. Saya menambahkan function baru untuk decrement
4. Saya membuat sebuah widgets bernama stack didalam untuk dapat menghasilkan 2 button yang dapat saya kontrol posisinya
5. Saya menambahkan kondisi apabila counter = 0, button dihilangkan

## Tugas 8

### Soal
#### 1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement. <br>
Perbedaan push dengan pushReplacement pada navigator adalah pada fungsi pop yang ada. Untuk push replacement, maka apabila kita visualisasikan dengan stack, terlihat bahwa push replacement menggantikan page sebelumnya dengan page yang dibuka, sedangkan pop hanya menumpuk page-page tersebut dalam stack. Visuaslisasi stack:
Push: A B C D -> hasil akhir stack apabila dibuka page A, B, C, D adalah A B C D (D paling atas)
Push Replacement : A B C D -> hasil akhir stack apabila dibuka page A, B, C, D adalah D

#### 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya. <br>
Center: Membuat komponen di center
Column: Membuat sebuah column agar dapat membuat komponen atas dan bawah
RoW: Membuat sebuah row agar suatu komponen dapat saya lakukan **space between**
TextButton: Sebuah button yang memiliki text
DropdownButtonFormField: Berbeda dengan lab sebelumnya, apabila DropDownbuttonFormField memiliki validator
Padding: Untuk memberikan padding
TextFormField: Untuk membuat input text.

#### 3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed). <br>
onPressed = apabila dipencet
onChange = apabila ada perubahan
onTap = Apabila dipencet, tidak berbeda jauh seperti onPressed
onSaved = Apabila ada disimpan
onSubmitted = Apabila dikumpulkan form
Masih banyak yang lainnya, yang dapat dikatakan, namun 5 event yang diatas merupakan event yang sering digunakan

#### 4.  Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter. <br>
Navigator mengontrol Stack yang berisi objek-objek rute yang mempunya 2 tipe yaitu deklaratif dan imperatif API (pop, push). Navigation sendiri beraksi seperti stack sehingga halaman yang terakhir ada di stack merupakan halaman yang akan diperlihatkan. Setiap kali ada perubahan halaman, maka halaman tersebut akan di push kedalam stack sehingga berada di top of stack. Namun apabila kita ingin kembali ke halaman sebelumnya, kita harus melakukan pop. 

#### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas. <br>
1. Membuat 2 file yaitu addBudget dan dataBudget.
2. Membuat drawer pada ketiga file tersebut 
3. Membuat input field pada addBudget
4. Menghandle input field pada addBudget
5. Memasukkan data yang didapat pada list
6. Menggunakan list tersebut lalu passing argumen ke dataBudget
7. Pada dataBudget, digunakan data yang didapat untuk menampilkan hasil yang diinginkan. 

## Tugas 9

### Soal
#### 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON? <br>
Tentu saja bisa, tanpa menggunakan models, maka yang dikirim akan berupa data mentah dalam `Future<http.Response>`. Hal ini akan membuat sulit untuk developer agar mengakses data tersebut, oleh karena itu dengan bantuan models kita dapat mengubah http response tersebut menjadi dart object. Menurut saya lebih baik untuk membuat model terlebih dahulu, tidak hanya lebih baik dan memudahkan namun juga agar code bisa menjadi lebih rapi

#### 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya. <br>
- Row dan Column: untuk membuat baigan-bagian agar mudah terstruktur
- Container: Untuk membuat semacam limiter/panduan
- ListView: untuk scrolling dan showing data
- FutureBuilder: build serta fetching data
- Widget-widget sebelumnya dipakai di lab sebelumnya

#### 3. Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter. <br>
Cara saya:
- Membuat model untuk processing data
- Menggunakan future builder agar bisa fetching data dan looping data
- Membuat fungsi untuk fetching data
- Mauskkan list tersebut ke 2 list terpisah (1 list untuk global, 1 lagi list untuk di return)
- Menggunakan list yang di return untuk data title
- Menggunakan list global untuk checkbox (bonus)
Sehingga mekanisme nya 
- Menambahkan package http serta memasukkan nya kedalam depedencies
- Membuat request kepada url yang diinginkan
- Mendapatkan response tersebut lalu (apabila ada models) diubah menjadi object dart
- Melakukan looping pada object dart yang dimasukkan dalam list 
- Mengeluarkan data tersebut sesuai dengan looping yang dilakukan

#### 4. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas. <br>
- Melanjutkan dari lab kemarin
- Merefactor seluruh halaman
- Membuat 2 page baru untuk list dan detail view
- Membuat widget yang stateful pada list dan stateless pada detail
- Melakukan fetching data agar diperlihatkan pada list
- Membuat model untuk processing fetching
- Memasukkan data pada 2 list 
- Membuat halaman baru detail dengan passing menggunakan context argument yang ada
- Menggunakan list yang tidak direturn untuk membuat bonus