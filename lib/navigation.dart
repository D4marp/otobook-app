import 'package:flutter/material.dart';
import 'package:frontend/screens/about.dart';
import 'package:frontend/screens/katalog.dart';
import 'package:frontend/screens/team.dart';
import 'screens/home.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(), // Halaman HomeScreen dari file terpisah
    KatalogScreen(), // Halaman lain
    AboutScreen(),
    AboutScreen(), // Halaman lain
    TeamScreen(), // Halaman lain
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Display the selected widget
          _widgetOptions[_selectedIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF005CBE), // Warna latar belakang BottomNavigationBar
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(width: 40), // Placeholder for scan icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_rounded),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Saya',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Menampilkan semua ikon terus-menerus
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle scan icon press
        },
        backgroundColor: Color(0xFF005CBE),
        child: Icon(Icons.camera_alt, color: Colors.white),
        elevation: 8.0, // Shadow effect
        highlightElevation: 12.0, // Increased shadow effect on press
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Center the FAB
    );
  }
}
