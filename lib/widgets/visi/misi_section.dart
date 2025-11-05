import 'package:flutter/material.dart';

class MisiSection extends StatelessWidget {
  const MisiSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> misi = [
      "Menyelenggarakan pendidikan dan pengajaran secara profesional sesuai perkembangan IPTEKS berdasarkan nilai-nilai Islam.",
      "Meningkatkan penelitian yang mendukung proses pembelajaran dan pengembangan IPTEKS untuk kesejahteraan masyarakat.",
      "Meningkatkan pengabdian kepada masyarakat untuk kesejahteraan masyarakat.",
      "Meningkatkan kerjasama dengan lembaga di dalam dan luar negeri.",
      "Meningkatkan tata kelola secara profesional berdasarkan nilai-nilai Islam.",
      "Meningkatkan pembinaan dan pengembangan kemahasiswaan berdasarkan nilai-nilai Islam."
    ];

    return _buildCard(title: "MISI", items: misi);
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
                  Expanded(
                    child: Text(items[i], style: const TextStyle(height: 1.5)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
