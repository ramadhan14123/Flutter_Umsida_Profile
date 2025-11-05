import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import '../widgets/header_widget.dart';
import '../widgets/home/image_carousel.dart';
import '../widgets/home/stats_grid.dart';
import '../widgets/home/promo_banner.dart';
import '../widgets/home/news_carousel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Content dengan scroll
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 100,
            ), // Memberikan ruang untuk header
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: ImageCarousel(
                    items: const [
                      'assets/images/banner-1.jpg',
                      'assets/images/banner-2.jpg',
                      'assets/images/banner-3.jpg',
                    ],
                    isNetwork: false,
                    height: 175,
                    autoPlay: true,
                  ),
                ),
                // Elements setelah carousel
                const StatsGrid(),
                const PromoBanner(),
                const NewsCarousel(),
                const SizedBox(height: 8),
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
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}
