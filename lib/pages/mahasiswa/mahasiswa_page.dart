import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/icons.dart';
import '../profile/profile_page.dart';
import 'dashboard_page.dart';
import 'schedules_page.dart';

class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({super.key});

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [ //halaman apa saja yang akan ditampilkan
    const DashboardPage(),
    const SchedulesPage(),
    const ProfilePage(role: 'Mahasiswa')
  ];

  void _onItemTapped(int index) { //method untuk mengatur halaman yang dipilih
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: ColorName.primary,
          onTap: _onItemTapped,   //mengatur halaman yang dipilih saat item ditekan
          items: const [
            BottomNavigationBarItem( //item navigasi bottom halaman utama
              icon: ImageIcon(IconName.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(IconName.chart),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(IconName.profile),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
