import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uas_mobile/screens/components/custom_radio.dart';
import 'package:uas_mobile/screens/components/gender.dart';

class AddBioPage extends StatefulWidget {
  const AddBioPage({super.key});

  @override
  State<AddBioPage> createState() => _AddBioPageState();
}

class _AddBioPageState extends State<AddBioPage> {
  final TextEditingController nimController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final List<Gender> genders = [];
  String jk = "Male";
  final TextEditingController tgllahirController = TextEditingController();

  String? nimError;
  String? namaError;
  String? alamatError;
  String? jkError;
  String? tgllahirError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genders.add(Gender("Male", Icons.male, true));
    genders.add(Gender("Female", Icons.female, false));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'Add Biodata',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff6777ef),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 24.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0, top: 16),
                    child: Column(
                      children: [
                        textFormFieldBio(TextInputType.text, namaController,
                            "Nama", Icons.person, namaError),
                        const SizedBox(height: 16),
                        textFormFieldBio(TextInputType.number, nimController,
                            "Nim", Icons.numbers, nimError),
                        const SizedBox(height: 16),
                        textFormFieldBio(TextInputType.text, alamatController,
                            "Alamat", Icons.map, alamatError),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: tgllahirController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            hintText: "Birth",
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey[600],
                            ),
                            errorText: namaError,
                            errorStyle: const TextStyle(
                              fontSize: 16.0,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 1.0),
                            ),
                          ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );

                            if (pickedDate != null) {
                              //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                tgllahirController.text = formattedDate;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              splashColor: Colors.pinkAccent,
                              onTap: () {
                                setState(() {
                                  genders[0].isSelected = true;
                                  genders[1].isSelected = false;
                                  jk = genders[0].name;
                                });
                              },
                              child: CustomRadio(gender: genders[0]),
                            ),
                            InkWell(
                              splashColor: Colors.pinkAccent,
                              onTap: () {
                                setState(() {
                                  genders[1].isSelected = true;
                                  genders[0].isSelected = false;
                                  jk = genders[1].name;
                                });
                              },
                              child: CustomRadio(gender: genders[1]),
                            ),
                          ],
                        ),
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
                        "Add",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  TextFormField textFormFieldBio(
    TextInputType keyboard,
    TextEditingController controller,
    String hint,
    IconData icon,
    error,
  ) {
    return TextFormField(
      keyboardType: keyboard,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: Colors.grey[600],
        ),
        errorText: namaError,
        errorStyle: const TextStyle(
          fontSize: 16.0,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
      onTap: () {
        setState(() {
          error = null;
        });
      },
    );
  }
}
