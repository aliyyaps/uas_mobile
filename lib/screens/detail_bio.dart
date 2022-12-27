import 'package:flutter/material.dart';
import 'package:uas_mobile/models/biodata.dart';

class DetailBioPage extends StatelessWidget {
  DetailBioPage({
    super.key,
    this.biodata,
  });

  Biodata? biodata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6777ef),
        title: const Text('Detail Biodata'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 24.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: CircleAvatar(
                          radius: 72.0,
                          backgroundImage: AssetImage('assets/foto-profil.png'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      textFormFieldReadOnly(biodata!.nama, Icons.person),
                      const SizedBox(height: 16),
                      textFormFieldReadOnly(
                          biodata!.nim.toString(), Icons.numbers),
                      const SizedBox(height: 16),
                      textFormFieldReadOnly(biodata!.jenisKelamin, Icons.male),
                      const SizedBox(height: 16),
                      textFormFieldReadOnly(biodata!.alamat, Icons.map),
                      const SizedBox(height: 16),
                      textFormFieldReadOnly(
                          biodata!.tglLahir, Icons.calendar_today),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xff6777ef),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(
                          color: Color(0xff6777ef),
                        ),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size.fromHeight(50),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "OK",
                      style: TextStyle(
                        fontSize: 18,
                      ),
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

  TextFormField textFormFieldReadOnly(String init, IconData icon) {
    // bisa dicustom icone passing param
    return TextFormField(
      keyboardType: TextInputType.text,
      readOnly: true,
      initialValue: init,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        prefixIcon: Icon(
          icon,
          color: Colors.grey[600],
        ),
        // errorText: editCategoryError,
        errorStyle: const TextStyle(
          fontSize: 16.0,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
      onTap: () {},
    );
  }
}
