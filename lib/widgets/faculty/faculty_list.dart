import 'package:flutter/material.dart';
import 'package:umsida_profile/theme/app_colors.dart';

class FacultyCategory {
  final String title;
  final List<String> programs;

  FacultyCategory({required this.title, required this.programs});
}

class FacultyList extends StatelessWidget {
  final List<FacultyCategory> categories = [
    FacultyCategory(
      title: 'Fakultas Agama Islam',
      programs: [
        'Pendidikan Agama Islam',
        'Pendidikan Bahasa Arab',
        'Pendidikan Guru MI',
        'Perbankan Syariah',
      ],
    ),
    FacultyCategory(
      title: 'Fakultas Psikologi dan Ilmu Pendidikan',
      programs: [
        'Pendidikan Guru PAUD',
        'Pendidikan Guru SD',
        'Pendidikan Guru Bahasa Inggris',
        'Pendidikan IPA',
        'Pendidikan Teknologi Informasi',
        'Psikologi',
      ],
    ),
    FacultyCategory(
      title: 'Fakultas Sains dan Teknologi',
      programs: [
        'Agroteknologi',
        'Teknologi Pangan',
        'Informatika',
        'Teknik Mesin',
        'Teknik Industri',
        'Teknik Elektro',
        'Teknik Sipil',
        'Sains Data',
      ],
    ),
  ];

  FacultyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildFacultySection(categories[index]);
      },
    );
  }

  Widget _buildFacultySection(FacultyCategory category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            category.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ...category.programs.map((program) {
          return _buildProgramItem(program);
        }).toList(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildProgramItem(String program) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Text(
        program,
        style: const TextStyle(color: Colors.black87, fontSize: 13),
      ),
    );
  }
}
