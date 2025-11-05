import 'package:flutter/material.dart';

class SasaranSection extends StatelessWidget {
  const SasaranSection({super.key});

  @override
  Widget build(BuildContext context) {
    final sasaran = [
      "Peningkatan kemampuan mahasiswa dalam penguasaan dan pengembangan IPTEKS berdasarkan nilai-nilai Islam.",
      "Peningkatan kapasitas dan kinerja penelitian dosen dan mahasiswa yang mendukung proses pembelajaran dan pengembangan IPTEKS.",
      "Peningkatan manfaat hasil penelitian untuk kesejahteraan masyarakat.",
      "Peningkatan kapasitas dan kinerja pengabdian kepada masyarakat untuk kesejahteraan masyarakat.",
      "Peningkatan dan perluasan kerjasama dengan lembaga dalam dan luar negeri.",
      "Penguatan tata kelola dan kelembagaan secara profesional berdasarkan nilai-nilai Islam.",
      "Peningkatan etos kerja dan perilaku organisasi yang sesuai dengan nilai-nilai Islam dan Kemuhammadiyahan.",
      "Peningkatan kemampuan mahasiswa dalam pencapaian prestasi.",
    ];
    return _buildCard(title: "SASARAN", items: sasaran);
  }

  Widget _buildCard({required String title, required List<String> items}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF003B84),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(height: 1, color: const Color(0xFF003B84)),
          const SizedBox(height: 12),
          for (int i = 0; i < items.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: const Color(0xFF003B84),
                    child: Text(
                      '${i + 1}',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(items[i], style: const TextStyle(height: 1.5))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
