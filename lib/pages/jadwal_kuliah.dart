import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JadwalKuliahCard extends StatelessWidget {
  final String namaMatkul;
  final String namaDosen;
  final String waktuKuliah;
  final Function onDelete;
  JadwalKuliahCard(this.namaMatkul, this.namaDosen, this.waktuKuliah,
      {required this.onDelete});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 30,
            child: SvgPicture.asset(
              'assets/profile-svgrepo-com.svg',
              height: 30,
              width: 80,
            ),
          ),
          Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                    height: 48,
                    child: Column(children: [
                      SizedBox(
                        width: 120,
                        height: 24,
                        child: Text(namaMatkul),
                      ),
                      SizedBox(
                        width: 120,
                        height: 16,
                        child: Text(namaDosen),
                      ),
                    ]))
              ])),
          const SizedBox(width: 16),
          SizedBox(
            child: Text(waktuKuliah),
          ),
          const SizedBox(width: 8),
          Divider(thickness: 16, color: Colors.black)
        ],
      ),
    );
  }
}
