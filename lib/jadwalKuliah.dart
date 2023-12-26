import 'package:SIAKMHS_NIM/pages/jadwal_kuliah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:SIAKMHS_NIM/Profil.dart';
import 'package:SIAKMHS_NIM/beranda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JadwalKuliah extends StatefulWidget {
  JadwalKuliah({super.key});
  @override
  State<JadwalKuliah> createState() => JadwalKuliahState();
}

class JadwalKuliahState extends State<JadwalKuliah> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference jadwalKuliah = firestore.collection('jadwalKuliah');
    return Scaffold(
      backgroundColor: Colors.cyan,
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
      ),
      body: Stack(children: [
        ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            //// VIEW DATA HERE
            StreamBuilder<QuerySnapshot>(
                stream: jadwalKuliah.snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data!.docs
                          .map((e) => JadwalKuliahCard(
                                  e['namaMatkul'],
                                  e['namaDosen'],
                                  e['waktuKuliah'], onDelete: () {
                                jadwalKuliah.doc(e.id).delete();
                              }))
                          .toList(),
                    );
                  } else {
                    return const Text('Loading');
                  }
                }),
            SizedBox(
              height: 150,
            )
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
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons8-clock (1).svg',
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
                        color: Color.fromARGB(255, 255, 255, 255),
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
                                  builder: (context) => const Profil()));
                        },
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
                        color: Color.fromARGB(255, 0, 0, 0),
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
