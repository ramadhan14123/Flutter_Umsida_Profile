import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact_icon_box.dart';

class ContactChatCard extends StatelessWidget {
  const ContactChatCard({super.key});

  Future<void> _launchWhatsApp() async {
    final Uri whatsappUrl = Uri.parse("https://wa.me/6281233363130?");
    if (!await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication)) {
      throw 'Tidak dapat membuka WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildCard(
      icon: CupertinoIcons.chat_bubble_fill,
      title: 'Chat',
      content:
          'Live Chat dan WhatsApp tersedia setiap hari kerja pukul 08.00–16.00 WIB (kecuali hari libur nasional).',
      buttonText: 'Live Chat',
      onPressed: _launchWhatsApp,
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String content,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ContactIconBox(icon: icon),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A3471),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A3471),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size(100, 36),
            ),
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
