import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact_icon_box.dart';

class ContactAddressCard extends StatelessWidget {
  const ContactAddressCard({super.key});

  Future<void> _launchMap(String url) async {
    final Uri mapUri = Uri.parse(url);
    if (!await launchUrl(mapUri, mode: LaunchMode.externalApplication)) {
      throw 'Tidak dapat membuka peta';
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
            children: const [
              ContactIconBox(icon: CupertinoIcons.location_solid),
              SizedBox(width: 8),
              Text(
                'Alamat',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A3471),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Kunjungi untuk informasi & layanan akademik',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),

          // Kampus 1
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: () =>
                  _launchMap('https://maps.app.goo.gl/3e5J3UUzgp1eEt586'),
              child: const _CampusAddress(
                title: 'Kampus 1 UMSIDA',
                address:
                    'Jl. Mojopahit No. 666 B, Sidowayah, Celep, Kec. Sidoarjo, Kabupaten Sidoarjo, Jawa Timur 61271',
              ),
            ),
          ),

          // Kampus 2
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: () =>
                  _launchMap('https://maps.app.goo.gl/TXyQgE4piJf3oH769'),
              child: const _CampusAddress(
                title: 'Kampus 2 UMSIDA',
                address:
                    'Jl. Raya Gelam No.250, Pagerwaja, Gelam, Kec. Candi, Kabupaten Sidoarjo, Jawa Timur 61271',
              ),
            ),
          ),

          // Kampus 3
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: () =>
                  _launchMap('https://maps.app.goo.gl/HADsXnsfpqkjK9TR9'),
              child: const _CampusAddress(
                title: 'Kampus 3 UMSIDA',
                address:
                    'Jl. Raya Lebo No.4, Rame, Pilang, Kec. Wonoayu, Kabupaten Sidoarjo, Jawa Timur 61261',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CampusAddress extends StatelessWidget {
  final String title;
  final String address;
  const _CampusAddress({required this.title, required this.address});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF2F5FA),
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F5FA),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A3471),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              address,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
