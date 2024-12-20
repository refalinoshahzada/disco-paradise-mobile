# disco_paradise

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Tugas 7
### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

Stateless widget dari namanya adalah widget yang tidak memilik "state" atau dalam kata lain widget yang dalam kondisi dapat berubah setelah widget tersebut dibuat. Widget yang ini cocok untuk menampilkan data yang statis atau tetap.

Stateful widget dari namanya adalah widget yang memiliki state atau kondisi yang bisa berubah setelah widget tersebut telah dibuat. Dalam kata lain, widget ini dapat memperbarui dirinya sendiri saat terjadi perubahan pada statenya sehingga UI dapat menyesuaikan dengan perubahan tersebut.

Beberapa perbedaan dari kedua hal tersebut adalah:
- Stateless widget tidak memiliki state atau kondisi yang dapat berubah, sedangkan stateful widget memiliki.
- Stateless widget tidak dapat mengubah UI setelah dibuat sedangkan stateful dapat
- Stateless widget digunakan untuk elemen yang statis sementara stateful digunakan untuk elemen yang dinamis
- Stateless widget lebih efisien dan ringan sedangkan stateful widget lebih kompleks.

### Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Pada berkas `main.dart`, saya menggunakan widget sebagai berikut:
1. `MaterialApp:

Menyediakan struktur dasar aplikasi Flutter, seperti tema, navigasi, dan pengaturan halaman utama (`home`). Dalam proyek ini, `MaterialApp` digunakan untuk menetapkan tema (dengan warna ungu) dan menetapkan `MyHomePage` sebagai halaman utama.

Pada berkas `menu.dart`, saya menggunakan widget sebagai berikut:
1. `Scaffold`

Widget yang menyediakan struktur dasar dari sebuah halaman aplikasi, seperti `AppBar`, `Body`, dan `FloatingActionButton`. Di sini, `Scaffold` digunakan untuk menampilkan `AppBar` dan `body` pada halaman `MyHomePage`

2. `Appbar`

Widget yang menampilkan bar di bagian atas halaman, biasanya berisi judul atau tombol navigasi. Pada proyek ini, `AppBar` digunakan untuk menampilkan judul "Disco Paradise" di bagian atas halaman.

3. `Padding`

Memberikan jarak atau ruang kosong di sekitar widget. Pada proyek ini, `Padding` digunakan untuk memberi jarak di sekeliling `body` halaman dan juga untuk mengatur jarak antara widget di dalam `body`.

4. `Column`

Widget tata letak yang menyusun widget lain secara vertikal. Pada proyek ini, `Column` digunakan untuk mengatur `InfoCard`, teks sambutan, dan `GridView` dalam satu kolom vertikal.

5. `Row`

Widget tata letak yang menyusun widget lain secara horizontal. Pada proyek ini, `Row` digunakan untuk menampilkan tiga `InfoCard` (NPM, Name, dan Class) secara bersebelahan.

6. `InfoCard`

Widget khusus (custom widget) yang didefinisikan dengan `StatelessWidget` untuk menampilkan informasi seperti NPM, Nama, dan Kelas. Widget ini terdiri dari `Card` yang berisi `title` dan `content`.

7. `Card`
Widget dengan tampilan kotak yang memiliki bayangan untuk menampilkan informasi secara menonjol. Di sini, `Card` digunakan untuk menampilkan informasi seperti NPM, Nama, dan Kelas di dalam `InfoCard`.

8. `SizedBox`

Widget untuk membuat jarak kosong dengan ukuran tertentu atau mengatur ukuran tetap dari widget. Pada proyek ini, `SizedBox` digunakan untuk menambahkan jarak vertikal antara `InfoCard` dan teks sambutan.

9. `Center`

Widget untuk menempatkan widget anak di tengah area yang tersedia. Di sini, `Center` digunakan untuk menempatkan `Column` yang berisi teks sambutan dan `GridView` agar berada di tengah halaman.

10. `Text`

Widget untuk menampilkan teks. Pada proyek ini, `Text` digunakan di beberapa tempat, termasuk di `AppBar` untuk judul, di `InfoCard` untuk menampilkan `title` dan `content`, dan dalam `ItemCard` untuk menampilkan nama item.

11. `GridView.count`

Widget untuk membuat tata letak grid dengan jumlah kolom yang ditentukan. Pada proyek ini, `GridView.count` digunakan untuk menampilkan `ItemCard` dalam grid dengan 3 kolom.

12. `ItemCard`

Custom widget yang dibuat dengan `StatelessWidget` untuk menampilkan kartu item dalam grid, lengkap dengan ikon dan nama item. `ItemCard` juga menggunakan `InkWell` agar kartu dapat merespons aksi tap dengan menampilkan pesan `SnackBar`.

13. `Material`

Widget dasar untuk menerapkan tema material pada widget anak. Pada proyek ini, `Material` digunakan di dalam `ItemCard` untuk menerapkan warna latar belakang sesuai skema warna aplikasi.

14. `InkWell`

Widget untuk menambahkan efek ripple saat widget ditekan, memberikan respons visual kepada pengguna. Pada proyek ini, `InkWell` digunakan dalam `ItemCard` untuk menampilkan pesan `SnackBar` ketika pengguna menekan kartu item.

15. `Icon`

Widget untuk menampilkan ikon. Pada proyek ini, `Icon` digunakan dalam `ItemCard` untuk menampilkan ikon yang sesuai dengan item (misalnya ikon mood, tambah, atau logout).

16. `SnackBar`

Widget untuk menampilkan pesan sementara di bagian bawah layar. Di sini, `SnackBar` digunakan untuk menampilkan pesan kepada pengguna setiap kali mereka menekan `ItemCard`.

### Apa fungsi dari `setState()?` Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Fungsi `setState()` dalam Flutter digunakan untuk memberi tahu framework bahwa ada perubahan pada state dari sebuah Stateful Widget yang membutuhkan pembaruan ulang (re-render) dari UI.\

Contoh variabel yang terpengaruhi oleh `setState()` adalah:
- Counter (`int counter`)
- Status (`bool isSelected`)

### Jelaskan perbedaan antara const dengan final.

Pada `const`:
- Nilai harus sudah diketahui pada waktu kompilasi dan tidak dapat diubah setelah ditetapkan
- Digunakan untuk mendeklarasikan konstanta compile-time sehingga bisa digunakan untuk membuat objek yang immutable
- Cocok untuk nilai yang konstan dan tidak berubah yang diketahui sebelumnya dalam pembuatan widget Flutter.

Pada `final`:
- Nilai dapat ditentukan pada waktu runtime, tetapi hanya dapat diatur satu kali
- Digunakan untuk mendeklarasikan variabel yang tidak bisa diubah setelah pertama kali diatur, tetapi nilainya bisa ditentukan pada runtime
- Cocok untuk variabel yang nilainya dihitung atau diatur secara dinamis tetapi tidak akan berubah setelah diatur

### Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

 - [x] Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
 
 Cara saya membuat sebuah program flutter baru adalah dengan cara pergi ke directory yang saya inginkan kemudian saya menggunakan `flutter create disco_paradise` untuk membuat direktori aplikasi dengan name `disco_paradise` kemudian menggunakan masuk direktori tersebut. Setelah membuat aplikasi pada direktori lokal, saya melakukan `git init` untuk inisialisasi repository baru pada github. 

 - [x]  Membuat tiga tombol sederhana dengan ikon dan teks untuk:
    - [x] Melihat daftar produk (Lihat Daftar Produk)
    - [x] Menambah produk (Tambah Produk)
    - [x] Logout (Logout)
- [x] Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
- [x] Memunculkan Snackbar dengan tulisan:

    - [x] "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan.
    - [x] "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan.
    - [x] "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.


Cara saya mengimplementasikan checklist tersebut adalah dengan pertama, merapikan struktur proyek saya dengan membuat berkas baru bernama `menu.dart`. Setelah saya membuat berkas tersebut saya edit berkas `main.dart` dan `menu.dart` saya sebagai berikut:

## `main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:disco_paradise/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Page',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
        ).copyWith(secondary: Colors.black),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

## `menu.dart`

```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget  {
  MyHomePage({super.key});

  final String npm = '2306152203';
  final String name = 'Refalino Shahzada Ghassani';
  final String className = 'PBP C';

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.mood, const Color.fromARGB(255, 235, 64, 52)),
    ItemHomepage("Tambah Produk", Icons.add, const Color.fromARGB(255, 52, 64, 235)),
    ItemHomepage("Logout", Icons.logout, const Color.fromARGB(255, 52, 235, 64)),
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Disco Paradise" dengan teks putih dan tebal.
        title: const Text(
          'Disco Paradise',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 16.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Disco Paradise!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class InfoCard extends StatelessWidget {
  // Kartu informasi yang menampilkan title dan content.

  final String title;  // Judul kartu.
  final String content;  // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Membuat kotak kartu dengan bayangan dibawahnya.
      elevation: 2.0,
      child: Container(
        // Mengatur ukuran dan jarak di dalam kartu.
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
```

Segala isi dari kedua berkas tersebut memenuhi semua checklist diatas.

# Tugas 8
### Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?

Kegunaan `const` di Flutter adalah untuk mendefinisikan widget atau nilai yang bersifat tetap dan tidak berubah sepanjang runtime.

Keuntungan Menggunakan `const` di Flutter:
1. **Optimalisasi Performa**: Flutter menghindari pembuatan ulang widget `const`, sehingga meningkatkan efisiensi.
2. **Memory Efficiency**: Objek `const` hanya dibuat sekali dan dibagikan di seluruh aplikasi, menghemat penggunaan memori.
3. **Hot Reload Cepat**: Menggunakan `const` mempercepat proses hot reload karena Flutter dapat langsung mengenali bahwa widget tersebut tidak perlu di-render ulang.

Kapan Menggunakan `const`:
- Gunakan `const` saat widget atau nilai tidak akan berubah setelah inisialisasi, seperti pada teks statis atau ikon tetap.
- Pada widget yang tidak memiliki state dan hanya menampilkan data yang tetap.

Kapan Tidak Menggunakan `const`:
- Jika widget atau nilai akan berubah sepanjang waktu, misalnya berdasarkan interaksi pengguna atau state yang dinamis, sebaiknya tidak menggunakan `const`.

### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

Column dan Row adalah widget di Flutter yang digunakan untuk menyusun widget secara vertikal dan horizontal.
Perbedaan:

  - Column: Menyusun widget secara vertikal (dari atas ke bawah).
  - Row: Menyusun widget secara horizontal (dari kiri ke kanan).

### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Elemen input yang saya gunakan pada halaman formm saya adalah sebagai berikut:
1. `TextFormField`: Digunakan untuk memasukkan data teks pada beberapa field, yaitu:
  - `Name`
  - `Price`
  - `Description`
  - `Date of Distribution`
  - `Stock Available`
  - `Genre`
2. `ElevatedButton`: Tombol "Save" untuk menyimpan data


### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Pada aplikasi ini, saya mengatur tema agar konsisten dengan menggunakan `ThemeData` di dalam widget `MaterialApp`. Tema diatur dalam properti `theme` dengan menggunakan `ColorScheme` dan `primarySwatch`, yang di sini diatur ke warna ungu (`Colors.green`) sebagai warna utama dan `black` sebagai warna sekunder. Saya juga mengaktifkan `useMaterial3` untuk mendapatkan tampilan yang lebih modern sesuai dengan standar Material Design 3.

Tema ini konsisten diterapkan ke seluruh aplikasi melalui widget `Theme.of(context)`, yang memudahkan perubahan warna elemen seperti `AppBar`, tombol, dan lainnya yang secara otomatis mengikuti warna utama dan sekunder yang sudah ditetapkan.

### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Pada aplikasi ini, untuk menangani navigasi saya menggunakan `Drawer`, lebih spesifiknya adalah `Drawer` pada bagian kiri aplikasi. Berikut adalah kode yang saya gunakan untuk implementasi `Drawer` tersebut:

```dart
import 'package:flutter/material.dart';
import 'package:disco_paradise/screens/menu.dart';
import 'package:disco_paradise/screens/albumentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Disco Paradise',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Buy all your favorite albums here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.album),
            title: const Text('Tambah Album'),
            // Bagian redirection ke MoodEntryFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlbumEntryFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
```

# Tugas 9
1. **Mengapa Membuat Model untuk JSON?**  
   Model digunakan untuk memetakan struktur data JSON ke dalam bentuk yang dapat dikelola oleh aplikasi. Tanpa model, manipulasi data menjadi rawan kesalahan, misalnya kesalahan tipe data atau key yang tidak ditemukan. Meski tanpa model tidak selalu menyebabkan error, manajemen data menjadi lebih sulit dan tidak terstruktur.

2. **Fungsi Library `http`:**  
   Library `http` digunakan untuk membuat permintaan HTTP (GET, POST, dll.) ke server, seperti mengambil data dari API atau mengirim data JSON. Library ini mempermudah komunikasi antara aplikasi Flutter dan server backend.

3. **Fungsi CookieRequest:**  
   `CookieRequest` digunakan untuk menangani autentikasi berbasis sesi dengan menyimpan cookie dari server. Instance `CookieRequest` perlu dibagikan ke seluruh komponen agar sesi login tetap konsisten di aplikasi, memungkinkan akses ke data pengguna tanpa perlu login ulang.

4. **Mekanisme Pengiriman Data:**  
   - Input data di Flutter dikumpulkan melalui form.  
   - Data dikirimkan dalam format JSON menggunakan library `http` ke backend Django.  
   - Django memproses data, menyimpannya ke database, dan mengembalikan respons.  
   - Flutter menerima respons dan menampilkan data sesuai kebutuhan pengguna.

5. **Mekanisme Autentikasi:**  
   - **Login/Register:** Data akun dikirim dari Flutter ke Django melalui POST request. Django memvalidasi data, membuat akun baru (register), atau mengautentikasi pengguna (login), lalu mengembalikan cookie/sesi untuk login berhasil.  
   - **Logout:** Django menghapus sesi saat menerima permintaan logout.  
   - Flutter menggunakan status login untuk menampilkan menu atau fitur khusus pengguna yang telah terautentikasi.
  

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
**Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter:**

Membuat halaman registrasi (`register.dart`) dengan form input untuk username, password, dan konfirmasi password.
Menggunakan widget TextFormField untuk input data pengguna.
Menambahkan tombol Register yang ketika ditekan akan mengirim data ke server Django menggunakan CookieRequest.
Menggunakan method postJson untuk mengirim data ke endpoint registrasi di server Django.

**Membuat halaman login pada proyek tugas Flutter:**

Membuat halaman login (login.dart) dengan form input untuk username dan password.
Menggunakan widget TextFormField untuk input username dan password.
Menambahkan tombol Login yang ketika ditekan akan mengautentikasi pengguna melalui server Django.
Menggunakan method login dari CookieRequest untuk mengirim data ke endpoint login Django.
Jika login berhasil, navigasi ke halaman utama aplikasi.

**Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter:**

Menggunakan paket pbp_django_auth untuk memudahkan integrasi autentikasi dengan Django.
Menyimpan cookie session dari Django untuk mempertahankan sesi login.
Menggunakan Provider untuk mengelola state autentikasi di seluruh aplikasi.
Membuat model kustom sesuai dengan proyek aplikasi Django:

Membuat model AlbumEntry sesuai dengan model di Django.
Menggunakan factory dan method toJson untuk serialisasi dan deserialisasi data JSON.
Model ini digunakan untuk memetakan data yang diterima dari endpoint JSON Django.

**Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah dideploy:**

Membuat halaman list_albumentry.dart yang akan menampilkan daftar album.
Menggunakan FutureBuilder untuk melakukan fetch data dari endpoint JSON Django.
Menggunakan method fetchAlbum yang mengirim request GET ke endpoint JSON Django.
Menampilkan name, price, dan description dari setiap item menggunakan widget ListView.builder.

**Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item:**

Menambahkan GestureDetector atau InkWell pada setiap item di list untuk mendeteksi klik.
Ketika item ditekan, navigasi ke halaman detail yang menampilkan semua atribut item tersebut.
Membuat halaman detail (album_detail.dart) yang menerima objek AlbumEntry sebagai parameter.
Menampilkan seluruh atribut seperti name, price, description, dateOfDistribution, stockAvailable, dan genre.
Menambahkan tombol kembali yang mengembalikan pengguna ke halaman daftar item.

**Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login:**

Menyesuaikan endpoint di Django untuk mengembalikan data yang terfilter berdasarkan pengguna yang sedang login.
Pada method fetchAlbum, pastikan request mengirim cookie session agar server mengenali sesi pengguna.
Di sisi Django, gunakan request.user untuk memfilter data yang dikembalikan.
Pastikan hanya item milik pengguna yang login yang ditampilkan di Flutter.