import 'package:flutter/material.dart';
import 'package:Otobook/screens/about.dart';
import 'package:Otobook/screens/katalog.dart';
import 'package:Otobook/screens/team.dart';
import 'screens/home.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

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
        backgroundColor: Color.fromARGB(255, 255, 255, 255), // Warna latar belakang BottomNavigationBar
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'List',
          ),
            BottomNavigationBarItem(
            icon: SizedBox.shrink(), 
            // Placeholder for scan icon
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
        selectedItemColor: Color(0xFF005CBE),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Menampilkan semua ikon terus-menerus
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle scan icon press
        },
        backgroundColor: Color(0xFF005CBE),
        child: Icon(Icons.center_focus_weak_sharp, 
        color: Colors.white,
        size: 40.0, // Set the icon size (default is 24.0)
        ),
        
        
        elevation: 8.0, // Shadow effect
        highlightElevation: 12.0, // Increased shadow effect on press
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Center the FAB
    );
  }
}