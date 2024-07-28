import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

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
      backgroundColor: Color.fromARGB(144, 255, 255, 255), // Background color
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                _buildPage(
                  svgPath: 'assets/about/about2.svg',
                  text1: 'OTOBOOK',
                  text2: 'Teman Perpustakaanmu',
                  text3: 'Aplikasi ini dibuat untuk mempermudah pengarsipan Meta Data buku di perpustakaan',
                  isBold: true,
                ),
                
              ],
            ),
          ),
          _buildPageIndicator(),
        ],
      ),
    );
  }

  Widget _buildPage({required String svgPath, required String text1, required String text2, required String text3, required bool isBold}) {
    return Stack(
      children: [
        // Background with curved bottom like "U"
        Positioned.fill(
          child: ClipPath(
            clipper: UClipper(),
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: SvgPicture.asset(
                  svgPath,
                  fit: BoxFit.contain,
                  placeholderBuilder: (context) => Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (text1.isNotEmpty)
                        Text(
                          text1,
                          style: TextStyle(
                            fontSize: 24.0, // Larger font size
                            color: Colors.blue, // Blue color
                            fontWeight: FontWeight.bold, // Bold text
                          ),
                          textAlign: TextAlign.center,
                        ),
                      SizedBox(width: 8.0), // Space between text1 and text2
                      Text(
                        text2,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  if (text3.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        text3,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(2, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            width: _currentPage == index ? 12.0 : 8.0,
            height: _currentPage == index ? 12.0 : 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index ? Colors.blue : Colors.grey[400],
            ),
          );
        }),
      ),
    );
  }
}

class UClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0.0, 0.0) // Mulai dari pojok kiri atas
      ..lineTo(size.width, 0.0) // Garis ke pojok kanan atas
      ..lineTo(size.width, size.height * 0.45) // Garis ke bawah (35% dari tinggi)
      ..quadraticBezierTo(
        size.width * 0.55, // Titik kontrol (tengah horizontal)
        size.height * 0.8, // Titik kontrol (kurva lebih halus dan lebih tajam)
        0.0, // Titik akhir (kiri bawah)
        size.height * 0.65, // Titik akhir (bawah)
      )
      ..close(); // Menutup path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
