# MyPortfolio Mobile

Aplikasi mobile multiplatform berbasis Flutter untuk menampilkan dan mengelola portofolio pribadi. Proyek ini merupakan kelanjutan dari ekosistem aplikasi web portofolio pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) Fakultas Ilmu Komputer Universitas Indonesia, Semester Gasal 2026/2027.

---

## Panduan Setup & Menjalankan Proyek

### Prasyarat
- Flutter SDK (versi stabil terbaru, teruji pada Flutter 3.47.9)
- Dart SDK
- IDE (Visual Studio Code atau Android Studio) beserta ekstensi Flutter & Dart
- Perangkat fisik Android/iOS, emulator, atau browser (Chrome)

### Langkah Instalasi (Minggu 1 - Tugas 7)
1. Clone repositori ini ke komputer lokal:
   ```bash
git clone https://github.com/Hafizh0205/myportofolio_mobile.git
cd myportofolio_mobile
   ```
2. Unduh seluruh dependensi proyek:
   ```bash
   flutter pub get
   ```
3. Pastikan konfigurasi lingkungan dan kualitas kode bersih tanpa peringatan:
   ```bash
   flutter doctor
   flutter analyze
   ```
4. Jalankan aplikasi pada perangkat atau browser:
   ```bash
   flutter run
   ```

---

## Pertanyaan Reflektif

### Tugas 7

1. **Jelaskan apa yang dimaksud dengan *widget tree* pada Flutter dan bagaimana hubungan induk-anak (*parent-child*) bekerja antar-widget!**
   *Widget tree* adalah struktur hierarki berbentuk pohon yang merepresentasikan seluruh elemen antarmuka pengguna (UI) dalam aplikasi Flutter, di mana setiap komponen visual maupun struktural adalah sebuah *widget*. Hubungan induk-anak (*parent-child*) bekerja dengan cara *parent widget* membungkus satu (`child`) atau lebih (`children`) *child widget* di dalamnya. Dalam proses *rendering*, *parent* mengirimkan batasan tata letak (*constraints*) ke bawah menuju *child*, kemudian *child* menentukan ukurannya sendiri sesuai batasan tersebut dan mengembalikannya ke *parent*, lalu *parent* menentukan posisi akhir *child* di layar. Selain itu, *child* juga dapat mewarisi dan mengakses konfigurasi atau tema yang disediakan oleh *parent* di atasnya melalui pohon widget.

2. **Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!**
   - **`MyApp` (`StatelessWidget`)**: Widget *root* aplikasi yang mengonfigurasi tema dan halaman awal.
   - **`MaterialApp`**: Menyediakan konfigurasi dasar aplikasi berbasis Material Design seperti tema (`ThemeData`), judul aplikasi, dan navigasi halaman utama (`home`).
   - **`MyHomePage` (`StatelessWidget`)**: Widget halaman utama menu portofolio yang bersifat statis.
   - **`Scaffold`**: Menyediakan struktur kerangka tata letak standar halaman Material Design, seperti `appBar` dan `body`.
   - **`AppBar`**: Menampilkan bilah judul di bagian atas halaman beserta warna latar belakangnya.
   - **`SingleChildScrollView`**: Membungkus konten halaman agar dapat digulir (*scroll*) secara vertikal sehingga mencegah *render overflow* pada layar berukuran kecil.
   - **`Padding`**: Memberikan jarak ruang kosong (*padding*) di sekeliling widget anaknya.
   - **`Column`**: Menyusun daftar widget anak secara vertikal dari atas ke bawah.
   - **`Row`**: Menyusun daftar widget anak secara horizontal dari kiri ke kanan (digunakan untuk menyejajarkan tiga `InfoCard`).
   - **`SizedBox`**: Memberikan jarak spasi dengan tinggi atau lebar tetap antar-widget.
   - **`Center`**: Memposisikan widget anaknya tepat di tengah ruang yang tersedia.
   - **`Text`**: Menampilkan teks pada layar dengan gaya tertentu (`TextStyle`) dan perataan (`TextAlign`).
   - **`GridView.count`**: Menampilkan kumpulan widget anak dalam tata letak kisi (*grid*) dengan jumlah kolom tetap (`crossAxisCount: 3`).
   - **`InfoCard` (`StatelessWidget`)**: Widget kustom untuk menampilkan kartu informasi profil (NPM, Name, dan Class).
   - **`Card`**: Menampilkan wadah berbentuk kartu dengan sudut membulat dan bayangan (*elevation*).
   - **`Container`**: Widget pembungkus serbaguna untuk mengatur lebar, *padding*, dan pembatasan ruang konten.
   - **`ItemCard` (`StatelessWidget`)**: Widget kustom untuk menampilkan tombol aksi portofolio beserta ikon, label, dan warna latar masing-masing.
   - **`Material`**: Memberikan permukaan visual Material Design seperti warna latar (`item.color`) dan sudut membulat (`borderRadius`), serta mendukung efek sentuhan `InkWell`.
   - **`InkWell`**: Menambahkan respons interaktif terhadap ketukan jari/klik (`onTap`) beserta efek riak (*ripple effect*).
   - **`Icon`**: Menampilkan ikon vektor dari pustaka Material Icons (`item.icon`).
   - **`SnackBar`**: Menampilkan pesan notifikasi sementara di bagian bawah layar saat tombol ditekan, yang dipicu melalui `ScaffoldMessenger`.

3. **Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini umumnya digunakan sebagai *root widget* pada aplikasi Flutter!**
   `MaterialApp` berfungsi sebagai pembungkus tingkat atas yang menyediakan berbagai fitur esensial untuk aplikasi berbasis standar Material Design, seperti manajemen tema global (`ThemeData`), sistem navigasi dan *routing* antarhalaman (`Navigator`), lokalisasi bahasa, serta pengelolaan `ScaffoldMessenger` untuk menampilkan `SnackBar`. Widget ini umumnya digunakan sebagai *root widget* agar seluruh turunan (*descendant*) di dalam *widget tree* memiliki akses yang konsisten terhadap konfigurasi tema, navigasi, dan konteks tata letak Material tanpa perlu mendefinisikannya berulang kali di setiap halaman.

4. **Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`! Kapan kita sebaiknya memilih `StatelessWidget` dan kapan harus menggunakan `StatefulWidget`?**
   - **`StatelessWidget`** adalah widget yang bersifat *immutable* (tidak dapat berubah setelah dibangun). Tampilannya hanya bergantung pada konfigurasi awal (`final` fields) yang diberikan saat inisialisasi dan tidak memiliki *state* internal yang berubah selama siklus hidupnya.
   - **`StatefulWidget`** adalah widget yang bersifat *mutable* secara dinamis karena memiliki objek `State` terpisah yang dapat menyimpan data yang berubah seiring waktu. Ketika data berubah melalui pemanggilan `setState()`, Flutter akan membangun ulang (*rebuild*) bagian UI tersebut.
   - **Waktu penggunaan**: Gunakan `StatelessWidget` ketika tampilan komponen bersifat statis atau hanya bergantung pada data yang dikirim dari *parent* (seperti kartu profil `InfoCard`, tombol statis `ItemCard`, atau halaman menu utama yang belum menyimpan input pengguna). Gunakan `StatefulWidget` ketika tampilan perlu berubah secara interaktif akibat aksi pengguna atau aliran data asinkron (seperti formulir input, penghitung/counter, animasi, atau pengambilan data API yang memperbarui UI).

5. **Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode `build`?**
   `BuildContext` adalah objek referensi yang menunjukkan lokasi spesifik suatu widget di dalam *widget tree*. Objek ini sangat penting karena menjadi jembatan bagi sebuah widget untuk berinteraksi dengan *ancestor* (induk) di atasnya dalam pohon widget. Di dalam metode `Widget build(BuildContext context)`, parameter `context` digunakan untuk mengambil data konfigurasi atau layanan dari widget leluhur terdekat, misalnya `Theme.of(context)` untuk mengambil skema warna tema pada `AppBar`, `MediaQuery.of(context)` untuk membaca lebar layar pada `InfoCard`, serta `ScaffoldMessenger.of(context)` untuk memunculkan `SnackBar` saat `ItemCard` ditekan.

6. **Jelaskan konsep *hot reload* di Flutter dan apa perbedaannya dengan *hot restart*! Kapan kita tidak bisa hanya mengandalkan *hot reload* dan harus melakukan *hot restart* atau *full restart*?**
   - ***Hot Reload*** bekerja dengan menyuntikkan berkas kode sumber Dart yang telah diperbarui ke dalam Dart Virtual Machine (VM) yang sedang berjalan, lalu membangun ulang (*rebuild*) *widget tree* dengan tetap mempertahankan keadaan (*state*) aplikasi saat itu. Prosesnya sangat cepat (kurang dari satu detik) dan cocok untuk menyesuaikan tampilan UI.
   - ***Hot Restart*** memuat ulang seluruh kode aplikasi ke dalam Dart VM dan memulai ulang aplikasi dari fungsi `main()`, sehingga seluruh *state* aplikasi direset ke kondisi awal, namun tanpa perlu mengompilasi ulang kode native (Android/iOS).
   - **Kapan tidak bisa mengandalkan *hot reload***: Kita harus melakukan ***hot restart*** ketika mengubah inisialisasi *state* awal (`initState`), mengubah variabel global atau properti `static`, mengubah struktur kelas/konstruktor secara signifikan, atau memodifikasi fungsi `main()`. Sementara itu, kita harus melakukan ***full restart*** (menghentikan dan menjalankan ulang proses build) ketika menambahkan dependensi/paket baru di `pubspec.yaml`, menambah aset/gambar/font baru, atau mengubah kode/konfigurasi platform native (seperti folder `android/` atau `ios/`).

---

## AI Disclosure

- **Tools yang Digunakan**: Gemini (AI Assistant) melalui antarmuka percakapan web.
- **Strategi Prompting**: Menggunakan pendekatan bertahap (*step-by-step*), dimulai dengan verifikasi kesiapan lingkungan pengembangan dan struktur proyek hasil Tutorial 08, dilanjutkan dengan validasi dan pembersihan kode `lib/menu.dart` serta `lib/main.dart`, hingga penyusunan dokumentasi dan alur commit Git.
- **Bagian yang Dibantu AI**:
  1. Memeriksa kebersihan kode `lib/menu.dart` dari karakter spasi tak terlihat (*non-breaking space*) akibat penyalinan kode dan menyarankan penambahan `SingleChildScrollView` untuk mencegah *layout overflow*.
  2. Membantu merumuskan poin-poin penjelasan konseptual pada bagian Pertanyaan Reflektif agar terstruktur dan sesuai dengan implementasi widget pada proyek ini.
- **Perbaikan Manual & Analisis Kritis**:
  - Saya menulis dan menyesuaikan identitas pribadi (NPM `2506656785`, nama lengkap `Hafizh Zuhdi Hartanto`, kelas `PBP B`), pemilihan palet warna tombol aksi (`Colors.indigo`, `Colors.amber.shade800`, `Colors.red.shade700`), membersihkan sintaks Markdown pada dokumentasi, serta melakukan verifikasi mandiri menggunakan `flutter analyze` hingga memperoleh hasil `No issues found!` sebelum melakukan `git commit` dan `git push`.