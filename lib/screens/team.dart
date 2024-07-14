import 'package:flutter/material.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  // Daftar nama tim
  List<String> teamNames = ['Dafa M. Irhamni', 'Damar Galih A. P.', 'M. Noer Dafiq', 'Waridatul Jannah', 'Pelangi Kartika C. K.'];
  List<String> teamJobs = ['Mechanical', 'Electrical', 'Electrical', 'Mobile Dev', 'Creative Desain'];
  List<String> teamImages = [
    'assets/images/daffa.png', // Make sure to provide correct paths to your images
    'assets/images/damar.png',
    'assets/images/dafiq.png',
    'assets/images/nana.png',
    'assets/images/pelangi.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: teamNames.length, // Jumlah persegi panjang yang ingin ditampilkan
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue, // Warna latar belakang biru
                borderRadius: BorderRadius.circular(8.0), // Bordes sudut
              ),
              padding: EdgeInsets.all(16.0), // Padding untuk konten dalam
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100, // Lebar persegi panjang (gambar) diperbesar
                    height: 130, // Tinggi persegi panjang (gambar) diperbesar
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 25, 63, 94), // Warna persegi panjang (gambar)
                      borderRadius: BorderRadius.circular(8.0), // Bordes sudut pada gambar
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter, // Menempatkan gambar ke bawah
                    
                        child: Image.asset(
                          teamImages[index], // Ganti dengan widget Image atau SvgPicture
                          fit: BoxFit.cover,
                          width: 80, // Lebar gambar
                          height: 130, // Tinggi gambar
                      
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0), // Jarak antara bagian kiri dan kanan
                  Expanded(
                    // Bagian kanan untuk teks atas dan bawah
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          teamNames[index], // Menampilkan nama tim sesuai indeks
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0), // Jarak antara teks atas dan bawah
                        Text(
                          teamJobs[index],
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
