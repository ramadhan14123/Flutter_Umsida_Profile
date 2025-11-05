import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact_icon_box.dart';
import 'package:umsida_profile/theme/app_colors.dart';

class ContactEmailCard extends StatelessWidget {
  const ContactEmailCard({super.key});

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'sekretariat@umsida.ac.id',
      query: 'subject=Pertanyaan%20Tentang%20Layanan%20UMSIDA',
    );
    if (!await launchUrl(emailUri)) {
      throw 'Tidak dapat membuka email';
    }
  }

  @override
  Widget build(BuildContext context) {
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
              const ContactIconBox(icon: Icons.mail),
              const SizedBox(width: 8),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Kami akan menjawab email anda sesegera mungkin selama jam operasional',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size(100, 36),
            ),
            onPressed: _launchEmail,
            child: const Text('Email'),
          ),
        ],
      ),
    );
  }
}
