import 'package:flutter/material.dart';

class SasaranSection extends StatelessWidget {
  const SasaranSection({super.key});

  final List<String> sasaranPoints = const [
    'Peningkatan kemampuan mahasiswa dalam penguasaan IPTEKS berdasarkan nilai-nilai Islam.',
    'Peningkatan kapasitas dan kinerja penelitian dosen dan mahasiswa yang mendukung proses pembelajaran dan pengembangan IPTEKS.',
    'Peningkatan manfaat hasil penelitian untuk kesejahteraan masyarakat untuk kesejahteraan masyarakat.',
    'Peningkatan kapasitas dan kinerja pengabdian kepada masyarakat untuk kesejahteraan lembaga dalam dan luar negeri.',
    'Peningkatan dan perluasan kerjasama dengan lembaga dalam dan luar negeri.',
    'Penguatan tata kelola dan kelembagaan secara profesional berdasarkan nilai-nilai Islam.',
    'Peningkatan etos kerja dan perilaku organisasi yang sesuai dengan nilai-nilai Islam dan kemuhammadiyahan.',
    'Peningkatan kemampuan mahasiswa dalam pencapaian prestasi.',
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
            'SASARAN',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(
            sasaranPoints.length,
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
                      sasaranPoints[index],
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
