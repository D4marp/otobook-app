import 'package:flutter/material.dart';
import 'package:frontend/screens/start.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make background transparent
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white24, // Background color for this section
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0), // Rounded corners at the bottom
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Profile',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StartScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0), // Adjust padding if needed
                      child: Image.asset(
                        'assets/logo_oto.PNG', // Path to the PNG image in assets
                        height: 40, // Decrease logo size if necessary
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi!, Nana',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0), // Space between texts
                  Text(
                    'Selamat datang di Otobook',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
