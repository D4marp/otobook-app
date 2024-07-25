import 'package:flutter/material.dart';
import 'package:frontend/screens/start.dart';

class KatalogScreen extends StatefulWidget {
  const KatalogScreen({super.key});

  @override
  State<KatalogScreen> createState() => _KatalogScreenState();
}

class _KatalogScreenState extends State<KatalogScreen> {
  final _formKey = GlobalKey<FormState>(); // Key to manage form state

  // Controllers for form fields
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _pengarangController = TextEditingController();
  final TextEditingController _penerbitController = TextEditingController();
  final TextEditingController _tahunTerbitController = TextEditingController();
  final TextEditingController _isbnController = TextEditingController();
  final TextEditingController _sinopsisController = TextEditingController();
  final TextEditingController _keywordController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is removed
    _judulController.dispose();
    _pengarangController.dispose();
    _penerbitController.dispose();
    _tahunTerbitController.dispose();
    _isbnController.dispose();
    _sinopsisController.dispose();
    _keywordController.dispose();
    super.dispose();
  }

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
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150, // Set a specific width for the button
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press for list of books
                        print('List of Books button pressed');
                      },
                      child: Text('List of Books'),
                    ),
                  ),
                ),
                Spacer(), // Push the logo to the right
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(_judulController, 'Judul', 'Please enter the title'),
                  SizedBox(height: 16.0),
                  _buildTextField(_pengarangController, 'Pengarang', 'Please enter the author'),
                  SizedBox(height: 16.0),
                  _buildTextField(_penerbitController, 'Penerbit', 'Please enter the publisher'),
                  SizedBox(height: 16.0),
                  _buildTextField(_tahunTerbitController, 'Tahun Terbit', 'Please enter the year of publication'),
                  SizedBox(height: 16.0),
                  _buildTextField(_isbnController, 'ISBN', 'Please enter the ISBN'),
                  SizedBox(height: 16.0),
                  _buildTextField(_sinopsisController, 'Sinopsis', 'Please enter the synopsis'),
                  SizedBox(height: 16.0),
                  _buildTextField(_keywordController, 'Keyword', 'Please enter keywords'),
                  SizedBox(height: 32.0), // Space for the button
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Handle form submission
                          print('Judul: ${_judulController.text}');
                          print('Pengarang: ${_pengarangController.text}');
                          print('Penerbit: ${_penerbitController.text}');
                          print('Tahun Terbit: ${_tahunTerbitController.text}');
                          print('ISBN: ${_isbnController.text}');
                          print('Sinopsis: ${_sinopsisController.text}');
                          print('Keyword: ${_keywordController.text}');
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField(TextEditingController controller, String labelText, String validationMessage) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    );
  }
}
