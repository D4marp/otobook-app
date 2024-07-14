import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/screens/start.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

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
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white, // Set the background color to a lighter shade of blue
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0), // Add margin on left, right, top, and bottom
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue, // Set the background color to blue
                      borderRadius: BorderRadius.circular(20.0), // Make the corners rounded
                    ),
                    child: Text(
                      'Ini adalah carousel text pertama',
                      style: TextStyle(fontSize: 24.0, color: Colors.white), // Set text color to white
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0), // Add margin on left, right, top, and bottom
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue, // Set the background color to blue
                      borderRadius: BorderRadius.circular(20.0), // Make the corners rounded
                    ),
                    child: Text(
                      'Ini adalah carousel text kedua',
                      style: TextStyle(fontSize: 24.0, color: Colors.white), // Set text color to white
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 36.0, vertical: 32.0), // Add margin on left, right, top, and bottom
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue, // Set the background color to blue
                      borderRadius: BorderRadius.circular(20.0), // Make the corners rounded
                    ),
                    child: Text(
                      'Ini adalah carousel text ketiga',
                      style: TextStyle(fontSize: 24.0, color: Colors.white), // Set text color to white
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
                width: _currentPage == index ? 12.0 : 8.0,
                height: _currentPage == index ? 12.0 : 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
