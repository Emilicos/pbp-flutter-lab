import 'package:flutter/material.dart';
import 'package:counter_7/widgets/drawer_opt.dart';
import 'package:intl/intl.dart';

class Budget {
  String? judul;
  int? nominal;
  String? tipe;
  String? date;

  Budget(
      String this.judul, int this.nominal, String this.tipe, String this.date);
}

List<Budget> listBudget = [];

class MyAddBudgetPage extends StatefulWidget {
  const MyAddBudgetPage({super.key});

  @override
  State<MyAddBudgetPage> createState() => _MyAddBudgetPageState();
}

class _MyAddBudgetPageState extends State<MyAddBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String judulBudget = "";
  int nominal = 0;
  String jawabanPilihan = "";
  List<String> pilihan = ["Pemasukkan", "Pengeluaran"];
  List<String> data = [];

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Budget'),
      ),
      drawer: const DrawerOpt(),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Judul Budget",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        judulBudget = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        judulBudget = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul budget tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Nominal Budget",
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        nominal = isNumeric(value!) ? int.parse(value) : 0;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        nominal = isNumeric(value!) ? int.parse(value) : 0;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          !(isNumeric(value))) {
                        return 'Nominal budget tidak boleh kosong atau string!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                          value: jawabanPilihan != "" ? jawabanPilihan : null,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: pilihan.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              jawabanPilihan = newValue!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty || value == "") {
                              return 'Pilih Dropdown dulu!';
                            }
                            return null;
                          },
                          hint: const Text(
                            "Pilih Jenis",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                    child: TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                )),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            listBudget.add(Budget(judulBudget, nominal,
                                jawabanPilihan, dateinput.text));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: ListView(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      const Center(
                                          child: Text(
                                              'Data sudah berhasil dibuat')),
                                      const SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Kembali'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                            // Add sesuatu
                          }
                        },
                        child: const Text(
                          "Simpan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
