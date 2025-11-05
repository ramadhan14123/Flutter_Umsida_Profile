import 'package:flutter/material.dart';

class TujuanSection extends StatelessWidget {
  const TujuanSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tujuan = [
      "Menghasilkan lulusan yang profesional dalam penguasaan IPTEKS berdasarkan nilai-nilai Islam.",
      "Menghasilkan penelitian untuk kesejahteraan masyarakat.",
      "Meningkatkan pengabdian kepada masyarakat untuk kesejahteraan masyarakat.",
      "Mewujudkan kerjasama dengan lembaga di dalam dan luar negeri untuk penguatan Catur Dharma Perguruan Tinggi Muhammadiyah.",
      "Mewujudkan kemandirian perguruan tinggi dengan tata kelola yang profesional berdasarkan nilai-nilai Islam.",
      "Meningkatkan prestasi akademik dan non akademik mahasiswa."
    ];
    return _buildCard(title: "TUJUAN", items: tujuan);
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
