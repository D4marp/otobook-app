import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Otobook/screens/start.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _frontImagePath1; // Path to the front book image taken for Book 1
  String? _backImagePath1; // Path to the back book image taken for Book 1
  String? _frontImagePath2; // Path to the front book image taken for Book 2
  String? _backImagePath2; // Path to the back book image taken for Book 2

  final TextEditingController _titleController1 = TextEditingController();
  final TextEditingController _authorController1 = TextEditingController();
  final TextEditingController _summaryController1 = TextEditingController();

  final TextEditingController _titleController2 = TextEditingController();
  final TextEditingController _authorController2 = TextEditingController();
  final TextEditingController _sinopsis= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130, // Mengatur tinggi app bar sesuai dengan ikon
        automaticallyImplyLeading: false, // Menghapus tombol kembali bawaan
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/icon.svg',
              height: 100,
              width: 180, // Mengatur lebar ikon sesuai kebutuhan
            ),
            Expanded(child: Container()), // Mengisi sisa ruang kosong di sebelah kanan ikon
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StartScreen()),
                  );
                },
                child: Image.asset(
                  'assets/logo_oto.PNG', // Path to the PNG image in assets
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Default view for both books
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Front Book'),
                      Container(
                        width: 100,
                        height: 150,
                        margin: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/harry.jpeg', // Replace with the path to your front book image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Back Book'),
                      Container(
                        width: 100,
                        height: 150,
                        margin: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/night.jpg', // Replace with the path to your back book image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40.0), // Space between books
              Column(
                children: [
                  Text('Front Book'),
                  Container(
                    width: 100,
                    height: 150,
                    margin: EdgeInsets.all(8.0),
                    child: Image.asset(
                      _frontImagePath1 ?? 'assets/harry.jpeg', // Replace with the path to your front book image
                      fit: BoxFit.cover,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _frontImagePath1 = 'assets/harry.jpeg'; // Path to the taken front book photo
                      });
                    },
                    child: Text('Edit/Crop Front Book'),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _titleController1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Book Title',
                      ),
                    ),
                  ),
                  Text('Back Book'),
                  Container(
                    width: 100,
                    height: 150,
                    margin: EdgeInsets.all(8.0),
                    child: Image.asset(
                      _backImagePath1 ?? 'assets/night.jpg', // Replace with the path to your back book image
                      fit: BoxFit.cover,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _backImagePath1 = 'assets/night.jpg'; // Path to the taken back book photo
                      });
                    },
                    child: Text('Edit/Crop Back Book'),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _summaryController1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Summarize the back book content',
                      ),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0), // Space between books
              Column(
                children: [
                  Text('Front Book'),
                  Container(
                    width: 100,
                    height: 150,
                    margin: EdgeInsets.all(8.0),
                    child: Image.asset(
                      _frontImagePath2 ?? 'assets/harry.jpeg', // Replace with the path to your front book image
                      fit: BoxFit.cover,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _frontImagePath2 = 'assets/harry.jpeg'; // Path to the taken front book photo
                      });
                    },
                    child: Text('Edit/Crop Front Book'),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _authorController2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Book Author',
                      ),
                    ),
                  ),
                  Text('Back Book'),
                  Container(
                    width: 100,
                    height: 150,
                    margin: EdgeInsets.all(8.0),
                    child: Image.asset(
                      _backImagePath2 ?? 'assets/night.jpg', // Replace with the path to your back book image
                      fit: BoxFit.cover,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _backImagePath2 = 'assets/night.jpg'; // Path to the taken back book photo
                      });
                    },
                    child: Text('Edit/Crop Back Book'),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _sinopsis,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'sinopsis',
                      ),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController1.dispose();
    _authorController1.dispose();
    _summaryController1.dispose();
    _titleController2.dispose();
    _authorController2.dispose();
    _sinopsis.dispose();
    super.dispose();
  }
}
