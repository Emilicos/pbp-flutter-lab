# counter_7

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Tugas 6

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
