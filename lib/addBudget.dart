import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/dataBudget.dart';
import 'package:flutter/cupertino.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Budget'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyAddBudgetPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyDataBudgetPage(data: data)),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                      if (value == null || value.isEmpty || !(isNumeric(value))) {
                        return 'Nominal budget tidak boleh kosong atau string!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width:150,
                    child: Column(
                      children: [
                          DropdownButtonFormField(
                            value: jawabanPilihan != ""? jawabanPilihan : null,
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
                            hint: Container(//and here
                              child: Text(
                                "Pilih Jenis",
                              ),
                            ),

                          ),
                      ],

                    ),
                  ),
                ),

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                            child: const Text(
                              "Simpan",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 15,
                                      child: Container(
                                        child: ListView(
                                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            Center(child: const Text('Data sudah berhasil dibuat')),
                                            SizedBox(height: 20),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Kembali'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                                var item = "${judulBudget}+${nominal}+${jawabanPilihan}";
                                data.add(item);
                              }
                            },
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}

