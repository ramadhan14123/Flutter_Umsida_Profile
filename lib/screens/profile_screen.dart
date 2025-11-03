import 'package:flutter/material.dart';
import '../widgets/footer.dart';

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
      body: Center(
        child: Text(
          'Halaman ke-${currentIndex + 1}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}
