import 'package:flutter/material.dart';
import 'package:umsida_profile/theme/app_colors.dart';

class ContactIconBox extends StatelessWidget {
  final IconData icon;
  const ContactIconBox({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
