import 'package:flutter/material.dart';

class TujuanSection extends StatelessWidget {
  const TujuanSection({super.key});

  final List<String> tujuanPoints = const [
    'Menghasilkan lulusan yang professional dalam penguasaan IPTEKS untuk kesejahteraan masyarakat.',
    'Menghasilkan penelitian untuk kesejahteraan masyarakat.',
    'Meningkatkan pengabdian kepada masyarakat untuk kesejahteraan masyarakat dan luar negeri untuk penguatan Catur Dharma Perguruan Tinggi Muhammadiyah.',
    'Mewujudkan kerjasama dengan lembaga di dalam dan luar negeri yang profesional berdasarkan nilai-nilai Islam.',
    'Mewujudkan kemandirian perguruan tinggi dengan tata kelola yang profesional berdasarkan nilai-nilai Islam.',
    'Meningkatkan prestasi akademik dan non akademik mahasiswa.',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TUJUAN',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(
            tujuanPoints.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      tujuanPoints[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
