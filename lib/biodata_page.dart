import 'package:flutter/material.dart';

class BiodataPage extends StatelessWidget {
  final txt1 = TextEditingController();
  final txt2 = TextEditingController();
  final txt3 = TextEditingController();
  final txt4 = TextEditingController();
  final txt5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("BIODATA")),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Text("ISI BIODATA\n"),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                decoration: InputDecoration(
                  label: Text("NIM: "),
                ),
                controller: txt1,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: TextField(
                decoration: InputDecoration(
                  label: Text("NAMA: "),
                ),
                controller: txt2,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: TextField(
                decoration: InputDecoration(
                  label: Text("ALAMAT: "),
                ),
                controller: txt3,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: TextField(
                decoration: InputDecoration(
                  label: Text("JENIS KELAMIN: "),
                ),
                controller: txt4,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: TextField(
                decoration: InputDecoration(
                  label: Text("TANGGAL LAHIR: "),
                ),
                controller: txt5,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                child: Text("Simpan"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
