import 'package:flutter/material.dart';
import 'package:umsida_profile/theme/app_colors.dart';

class VisiSection extends StatelessWidget {
  const VisiSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildCard(
      title: "VISI",
      content:
          "Menjadi perguruan tinggi unggul dan inovatif dalam pengembangan IPTEKS berdasarkan nilai-nilai Islam untuk kesejahteraan masyarakat.",
    );
  }

  Widget _buildCard({required String title, required String content}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 8),
          Container(height: 1, color: AppColors.primaryBlue),
          const SizedBox(height: 12),
          Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}
