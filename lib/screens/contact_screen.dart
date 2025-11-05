import 'package:flutter/material.dart';
import '../widgets/contact/contact_chat_card.dart';
import '../widgets/contact/contact_email_card.dart';
import '../widgets/contact/contact_address_card.dart';
import '../widgets/footer.dart';
import '../widgets/header_widget.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 3;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          // 🔹 Konten utama bisa di-scroll
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 100,
            ), // beri jarak setinggi header
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: const [
                  ContactChatCard(),
                  SizedBox(height: 12),
                  ContactEmailCard(),
                  SizedBox(height: 12),
                  ContactAddressCard(),
                ],
              ),
            ),
          ),

          // 🔹 Header tetap di atas (absolute)
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

      // 🔹 Footer navigasi
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
      case 3:
        // Sudah di halaman contact
        break;
    }
  }
}
