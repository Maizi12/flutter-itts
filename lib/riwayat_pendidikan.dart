import 'package:SIAKMHS_NIM/pages/item_cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RiwayatPendidikan extends StatefulWidget {
  RiwayatPendidikan({super.key});
  @override
  State<RiwayatPendidikan> createState() => _RiwayatPendidikanState();
}

class _RiwayatPendidikanState extends State<RiwayatPendidikan> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tahunController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference riwayatPendidikan =
        firestore.collection('riwayatPendidikan');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat Pendidikan'),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              children: [
                //// VIEW DATA HERE
                StreamBuilder<QuerySnapshot>(
                    stream: riwayatPendidikan
                        .orderBy('tahunlulus', descending: true)
                        .snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: snapshot.data!.docs
                              .map((e) =>
                                  ItemCard(e['namasekolah'], e['tahunlulus'],
                                      onDelete: () {
                                    riwayatPendidikan.doc(e.id).delete();
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
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-5, 0),
                        blurRadius: 15,
                        spreadRadius: 3)
                  ]),
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: namaController,
                              decoration: const InputDecoration(
                                  label: Text("Nama Sekolah"),
                                  border: UnderlineInputBorder()),
                            ),
                            TextField(
                              controller: tahunController,
                              decoration: const InputDecoration(
                                  label: Text("Tahun Lulus"),
                                  border: UnderlineInputBorder()),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                        child: ElevatedButton(
                            child: Text('Tambah'),
                            onPressed: () {
                              riwayatPendidikan.add({
                                'namasekolah': namaController.text,
                                'tahunlulus':
                                    int.tryParse(tahunController.text) ?? 0
                              });
                            }),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
