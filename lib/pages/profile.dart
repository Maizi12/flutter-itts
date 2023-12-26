import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:SIAKMHS_NIM/riwayat_pendidikan.dart';

class ProfilCard extends StatelessWidget {
  final String nama;
  final String nim;
  final String prodi;

  ProfilCard(this.nama, this.nim, this.prodi);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 425,
        height: 700,
        color: Colors.cyan,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 400,
            height: 300,
            child: SvgPicture.asset(
              'assets/profile-svgrepo-com.svg',
              height: 30,
              width: 120,
            ),
          ),
          Container(
              width: 400,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nama,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF005A92),
                      fontSize: 20,
                      fontFamily: 'SF Pro Rounded',
                      fontWeight: FontWeight.w600,
                      height: 3,
                    ),
                  ),
                  Text(
                    nim,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF005A92),
                      fontSize: 20,
                      fontFamily: 'SF Pro Rounded',
                      fontWeight: FontWeight.w600,
                      height: 3,
                    ),
                  ),
                  Text(
                    prodi,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF005A92),
                      fontSize: 20,
                      fontFamily: 'SF Pro Rounded',
                      fontWeight: FontWeight.w600,
                      height: 3,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RiwayatPendidikan(),
                            ));
                      },
                      child: Text("Riwayat Pendidikan")),
                ],
              ))
        ]));
  }
}
