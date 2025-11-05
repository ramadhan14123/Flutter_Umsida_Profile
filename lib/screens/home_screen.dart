import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/first_page/hero_banner.dart';
import '../widgets/first_page/primary_button.dart';
import 'profile_screen.dart';

class TopCurveClipper extends CustomClipper<Path> {
  /// depth controls how deep the curve arcs upward (positive = higher arch)
  final double depth;

  TopCurveClipper({this.depth = 40});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, depth);
    path.quadraticBezierTo(size.width * 0.5, -depth, size.width, depth);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant TopCurveClipper oldClipper) =>
      oldClipper.depth != depth;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            const Expanded(
              child: Center(child: HeroBanner(sizeFactor: 0.8)),
            ),
            Expanded(
              child: ClipPath(
                clipper: TopCurveClipper(depth: 50),
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFF123A70),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: media.width * 0.9,
                          ),
                          child: Text(
                            '"Ingin tahu lebih banyak tentang UMSIDA?"',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: 12),

                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: media.width * 0.9,
                          ),
                          child: Text(
                            '- Temukan profil, prestasi, dan informasi seputar UMSIDA secara lengkap -',
                            style: GoogleFonts.montserrat(
                              color: const Color.fromRGBO(255, 255, 255, 0.9),
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: 24),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: PrimaryButton(
                            text: 'Lihat Profil Kampus',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
