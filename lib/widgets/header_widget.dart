import 'package:flutter/material.dart';
import 'package:umsida_profile/theme/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  final VoidCallback? onBackPressed; // aksi tombol back
  final String logoPath; // path ke logo UMSIDA (misal di assets)

  const HeaderWidget({super.key, this.onBackPressed, required this.logoPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primaryBlue, // gunakan warna biru tua dari AppColors
      ),
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Tombol Back
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: onBackPressed ?? () => Navigator.pop(context),
          ),

          // Logo di tengah
          Expanded(
            child: Center(
              child: Image.asset(
                logoPath,
                height: 50,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),

          // Spacer agar logo tetap di tengah
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
