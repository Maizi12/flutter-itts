import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String namaSekolah;
  final int tahunLulus;
  final Function onDelete;
  const ItemCard(this.namaSekolah, this.tahunLulus, {required this.onDelete});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(namaSekolah,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ),
              Text(
                "Lulus tahun : $tahunLulus",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Colors.red, //<-- SEE HERE
                    ),
                    child: Center(
                        child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      onDelete();
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
