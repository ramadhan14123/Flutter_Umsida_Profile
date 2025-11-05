import 'package:flutter/material.dart';

class MisiSection extends StatelessWidget {
  const MisiSection({super.key});

  final List<String> misiPoints = const [
    'Menyelenggarakan pendidikan dan pengajaran secara professional sesuai perkembangan IPTEKS berdasarkan nilai-nilai Islam.',
    'Meningkatkan penelitian yang mendukung proses pembelajaran dan pengembangan IPTEKS untuk kesejahteraan masyarakat.',
    'Meningkatkan pengabdian kepada masyarakat untuk kesejahteraan masyarakat.',
    'Meningkatkan kerjasama dengan lembaga di dalam dan luar negeri.',
    'Meningkatkan tata kelola secara professional berdasarkan nilai-nilai Islam.',
    'Meningkatkan pembinaan dan pengembangan kemuhammadiyahan berdasarkan nilai-nilai Islam.',
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
            'MISI',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(
            misiPoints.length,
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
                      misiPoints[index],
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
