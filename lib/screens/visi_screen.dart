import 'package:flutter/material.dart';
import '../widgets/visi/visi_section.dart';
import '../widgets/visi/misi_section.dart';
import '../widgets/visi/tujuan_section.dart';
import '../widgets/visi/sasaran_section.dart';
import '../widgets/header_widget.dart';
import '../widgets/footer.dart';

class VisiScreen extends StatefulWidget {
  const VisiScreen({super.key});

  @override
  State<VisiScreen> createState() => _VisiScreenState();
}

class _VisiScreenState extends State<VisiScreen> {
  late Image _rektorImage;

  @override
  void initState() {
    super.initState();

    // siapkan instance gambar
    _rektorImage = Image.asset(
      'assets/images/rektor12.png',
      height: 200,
      fit: BoxFit.contain,
    );

    // pastikan dipanggil setelah frame pertama
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(_rektorImage.image, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: HeaderWidget(
          logoPath: 'assets/images/logo1.png',
          onBackPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(height: 250, color: const Color(0xFF003B84)),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: _rektorImage,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const VisiSection(),
                const SizedBox(height: 20),
                const MisiSection(),
                const SizedBox(height: 20),
                const TujuanSection(),
                const SizedBox(height: 20),
                const SasaranSection(),
                const SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomFooter(
              currentIndex: 1,
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.pushReplacementNamed(context, '/home');
                    break;
                  case 2:
                    Navigator.pushReplacementNamed(context, '/faculty');
                    break;
                  case 3:
                    Navigator.pushReplacementNamed(context, '/contact');
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
