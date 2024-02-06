import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../../common/components/buttons.dart';
import '../../common/components/custom_scaffold.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/icons.dart';
import '../../common/constants/images.dart';

class AbsensiPage extends StatefulWidget {
  const AbsensiPage({super.key});

  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  final List<TimeOfDay> times = [ //daftar waktu riwayat absensi
    const TimeOfDay(hour: 8, minute: 0),
    const TimeOfDay(hour: 9, minute: 15),
    const TimeOfDay(hour: 10, minute: 30),
    const TimeOfDay(hour: 11, minute: 45),
    const TimeOfDay(hour: 12, minute: 0),
    const TimeOfDay(hour: 13, minute: 30),
    const TimeOfDay(hour: 14, minute: 45),
    const TimeOfDay(hour: 15, minute: 0),
    const TimeOfDay(hour: 16, minute: 15),
    const TimeOfDay(hour: 17, minute: 30),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),//memastikan bahwa widget yang menggunakan physics ini tidak akan bisa di scroll 

        children: [
          Container( //informasi mahasiswa dan waktu saat ini
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: ColorName.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  color: ColorName.black.withOpacity(0.25),
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 20.0),
                  child: Row(
                    children: [
                      ClipRRect( //widget dengan fungsi membatasi konten 
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                        child: Image.network(
                          'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2021/12/15/1405406409.jpg',
                          width: 72.0,
                          height: 72.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 11.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16.0)),
                              border: Border.all(color: ColorName.primary),
                            ),
                            child: const Text(
                              'Mahasiswa',
                              style: TextStyle(
                                color: ColorName.primary,
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Text(
                            "Kelompok 1",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: ColorName.primary,
                            ),
                          ),
                          const Text(
                            "Rabu, 7 Februari 2024",
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Dash(
                  length: MediaQuery.of(context).size.width - 60.0,
                  dashColor: const Color(0xffD5DFE7),
                ),
                const SizedBox(height: 12.0),
                StreamBuilder( //waktu saat ini
                  stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
                  builder: (context, snapshot) {
                    final currentTime = DateTime.now();
                    final formattedTime =
                        "${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')} WIB";

                    return Text(
                      formattedTime,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue, 
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Image.asset(
            Images.maps,
            height: 184.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20.0),
          Button.filled(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const ScanPage(),
              //   ),
              // );
            },
            label: 'SCAN',
            icon: const ImageIcon(
              IconName.scan,
              color: ColorName.white,
            ),
            borderRadius: 50.0,
          ),
          const SizedBox(height: 30.0),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
                color: ColorName.primary,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Riwayat Absensi",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorName.white,
                  ),
                ),
                const SizedBox(height: 5), //daftar waktu absensi
                for (int i = 0; i < times.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      "JAM ${times[i].format(context)}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorName.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
