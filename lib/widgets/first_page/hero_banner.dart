import 'package:flutter/material.dart';
class HeroBanner extends StatelessWidget {
  final double sizeFactor;
  final String assetPath;

  const HeroBanner({
    super.key,
    this.sizeFactor = 0.8,
    this.assetPath = 'assets/images/umsida_logo.png',
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final imageWidth = (width * sizeFactor).clamp(80.0, 280.0);

    return Center(
      child: Image.asset(
        assetPath,
        width: imageWidth,
        fit: BoxFit.contain,
      ),
    );
  }
}
