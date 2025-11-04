import 'package:flutter/material.dart';
import '../widgets/footer.dart';
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
      appBar: AppBar(
        title: const Text('Profil UMSIDA'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      // Use a scrollable ListView so the screen doesn't overflow on small devices.
      // The previous Column could overflow when the combined children are taller than
      // the available viewport. ListView makes the content scrollable instead.
      body: ListView(
        padding: EdgeInsets.zero,
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

          const StatsGrid(),

          // promo banner under stats
          const PromoBanner(),

          // News carousel under promo
          const NewsCarousel(),

          const SizedBox(height: 8),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Halaman ke-${currentIndex + 1}',
                style: const TextStyle(fontSize: 20),
              ),
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
