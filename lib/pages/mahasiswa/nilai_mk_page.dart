import 'package:flutter/material.dart';

import '../../common/components/custom_scaffold.dart';
import '../../common/constants/colors.dart';
import 'models/course_grade_model.dart';
import 'widgets/course_grade_tile.dart';

class NilaiMkPage extends StatefulWidget {
  const NilaiMkPage({super.key});

  @override
  State<NilaiMkPage> createState() => _NilaiMkPageState();
}

class _NilaiMkPageState extends State<NilaiMkPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold( //menggunakan custom scafold sebagai kerangka halaman
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Text(
            "Nilai Mata Kuliah",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "3 of 10 results",
                style: TextStyle(
                  color: ColorName.grey,
                ),
              ),
              IconButton( //menampilkan tombol filter dengan ikon filter_list
                onPressed: () {}, //aksi saat tombol ditekan
                icon: const Icon(Icons.filter_list),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          CourseGradeTile( //menampilkan nilai mata kuliah
            data: CourseGradeModel(
              information: '',
              attendance: 'Hadir',
              course: 'Pemrograman Piranti Bergerak',
              grade: 100,
              description: 'Tugas Praktikum',
            ),
          ),
          const SizedBox(height: 50.0),
          CourseGradeTile(
            data: CourseGradeModel(
              information: '',
              attendance: 'Hadir',
              course: 'Basis Data',
              grade: 90,
              description: 'Tugas Teori',
            ),
          ),
          const SizedBox(height: 50.0),
          CourseGradeTile(
            data: CourseGradeModel(
              information: '',
              attendance: 'Hadir',
              course: 'Pemrograman Web 3',
              grade: 90,
              description: 'Tugas Praktikum',
            ),
          ),
        ],
      ),
    );
  }
}
