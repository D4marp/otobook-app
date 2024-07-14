import 'package:flutter/material.dart';

class KatalogScreen extends StatefulWidget {
  const KatalogScreen({super.key});

  @override
  State<KatalogScreen> createState() => _KatalogScreenState();
}

class _KatalogScreenState extends State<KatalogScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          height: 40.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 8.0, // Adjust the elevation value to control the shadow
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Romance Books',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _buildBookPages([
                'assets/harry.jpeg',
                'assets/night.jpg',
                'assets/perahu_kertas.jpeg',
                'assets/harry.jpeg',
                'assets/night.jpg',
                'assets/perahu_kertas.jpeg',
              ]),
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Comedy Books',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _buildBookPages([
                'assets/harry.jpeg',
                'assets/night.jpg',
                'assets/perahu_kertas.jpeg',
                'assets/harry.jpeg',
                'assets/night.jpg',
                'assets/perahu_kertas.jpeg',
              ]),
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Horror Books',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _buildBookPages([
                'assets/harry.jpeg',
                'assets/night.jpg',
                'assets/perahu_kertas.jpeg',
                'assets/harry.jpeg',
                'assets/night.jpg',
                'assets/perahu_kertas.jpeg',
              ]),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBookPages(List<String> bookPaths) {
    List<Widget> pages = [];
    for (int i = 0; i < bookPaths.length; i += 3) {
      pages.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (i < bookPaths.length) _buildBookContainer(bookPaths[i]),
            if (i + 1 < bookPaths.length) _buildBookContainer(bookPaths[i + 1]),
            if (i + 2 < bookPaths.length) _buildBookContainer(bookPaths[i + 2]),
          ],
        ),
      );
    }
    return pages;
  }

  Widget _buildBookContainer(String imagePath) {
    return Container(
      padding: EdgeInsets.all(8.0), // Optional padding between books
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }
}
