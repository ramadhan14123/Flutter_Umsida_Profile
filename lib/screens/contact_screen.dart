import 'package:flutter/material.dart';
import '../widgets/contact/contact_header.dart';
import '../widgets/contact/contact_chat_card.dart';
import '../widgets/contact/contact_email_card.dart';
import '../widgets/contact/contact_address_card.dart';
import '../widgets/footer.dart';

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
      appBar: const ContactHeader(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            ContactChatCard(),
            ContactEmailCard(),
            ContactAddressCard(),
          ],
        ),
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
      case 3:
        // Already on contact screen
        break;
    }
  }
}
