import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import '../widgets/header_widget.dart';
import '../widgets/visi/visi_section.dart';
import '../widgets/visi/misi_section.dart';
import '../widgets/visi/tujuan_section.dart';
import '../widgets/visi/sasaran_section.dart';

class VisiScreen extends StatefulWidget {
  const VisiScreen({super.key});

  @override
  State<VisiScreen> createState() => _VisiScreenState();
}

class _VisiScreenState extends State<VisiScreen> {
  int _currentIndex = 2; // Index untuk footer navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Content yang bisa di-scroll
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 100,
            ), // Memberikan ruang untuk header
            child: Column(
              children: const [
                VisiSection(),
                MisiSection(),
                TujuanSection(),
                SasaranSection(),
                SizedBox(height: 20), // Padding bottom
              ],
            ),
          ),

          // Header yang tetap di posisi atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderWidget(
              logoPath: 'assets/images/logo1.png',
              onBackPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _navigateToRoute(index);
        },
      ),
    );
  }

  void _navigateToRoute(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 2:
        // Sudah di halaman visi
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/contact');
        break;
    }
  }
}
