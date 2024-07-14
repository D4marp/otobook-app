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
          for (int i = 0; i < _widgetOptions.length; i++)
            Visibility(
              visible: _selectedIndex == i,
              maintainState: true,
              child: _widgetOptions[i],
            ),
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
            icon: Icon(Icons.timer_rounded),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Team',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Menampilkan semua ikon terus-menerus
      ),
    );
  }
}
