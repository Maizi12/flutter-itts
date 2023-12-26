import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:SIAKMHS_NIM/beranda.dart';
import 'package:SIAKMHS_NIM/jadwalKuliah.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:SIAKMHS_NIM/pages/profile.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference profil = firestore.collection('profil');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistem Akademik Mahasiswa'),
        centerTitle: true,
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                child: GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              child: Image.asset("assets/icons8-logout-50.png"),
            ))
          ])
        ],
        backgroundColor: Colors.cyan,
      ),
      body: Stack(children: [
        ListView(
          children: [
            //// VIEW DATA HERE
            StreamBuilder<QuerySnapshot>(
                stream: profil.snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data!.docs
                          .map((e) =>
                              ProfilCard(e['Nama'], e['NIM'], e['Prodi']))
                          .toList(),
                    );
                  } else {
                    return const Text('Loading');
                  }
                }),
          ],
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Row(children: [
            Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SizedBox(
                      width: 100,
                      height: 30,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Beranda()));
                        },
                        child: SvgPicture.asset(
                          'assets/icons8-home.svg',
                          height: 30,
                          width: 100,
                        ),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 10,
                        fontFamily: 'SF Pro Rounded',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ])),
            Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SizedBox(
                      width: 100,
                      height: 30,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JadwalKuliah()));
                        },
                        child: SvgPicture.asset(
                          'assets/icons8-clock.svg',
                          height: 30,
                          width: 100,
                        ),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Jadwal Kuliah',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 10,
                        fontFamily: 'SF Pro Rounded',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ])),
            Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: GestureDetector(
                        onTap: () {},
                        child:
                            Image.asset("assets/icons8-male-user-50(1).png")),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Profil',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 10,
                        fontFamily: 'SF Pro Rounded',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ]))
          ])),
    );
  }
}
