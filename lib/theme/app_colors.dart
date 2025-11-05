import 'package:flutter/material.dart';

/// Centralized color palette for the app.
///
/// Add new colors here instead of scattering hex values across files.
/// Naming suggestion: [role][Shade] or semantic names like primaryBlue, accentOrange.
class AppColors {
  AppColors._();

  // Brand primaries
  static const Color primaryBlue = Color(0xFF123A70); // dark brand blue
  static const Color primaryBlueBorder = Color(0xFF2B63C8); // lighter brand blue (borders/buttons)
  static const Color accentOrange = Color(0xFFF28C2B);

  // Surfaces
  static const Color surfaceBlue = Color(0xFFF3F9FF);

  // Indicators / misc
  static const Color indicatorActive = Color(0xFF013066);
  static const Color indicatorInactive = Color(0x4D013066); // 30% alpha of active
}
