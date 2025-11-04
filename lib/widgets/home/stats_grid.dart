import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  Widget _buildCard(BuildContext context, IconData icon, String value, String label) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F9FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF2B63C8), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 52, color: const Color(0xFF123A70)),
            const SizedBox(height: 0),
            Text(
              value,
              style:GoogleFonts.montserrat(fontWeight: FontWeight.w800,fontSize: 24,color: const Color(0xFF123A70))),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, color: Colors.black54, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: LayoutBuilder(builder: (context, constraints) {
        return GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          children: [
            _buildCard(context, Icons.school, '27', 'Prodi'),
            _buildCard(context, Icons.apartment, '7', 'Fakultas'),
            _buildCard(context, Icons.group, '3.598', 'Mahasiswa'),
            _buildCard(context, Icons.person, '598', 'Dosen'),
          ],
        );
      }),
    );
  }
}
