import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/pages/data_budget.dart';
import 'package:counter_7/pages/add_budget.dart';
import 'package:counter_7/pages/my_watchlist.dart';

class DrawerOpt extends StatelessWidget {
  const DrawerOpt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                MaterialPageRoute(
                    builder: (context) => const MyAddBudgetPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyDataBudgetPage()),
              );
            },
          ),

          ListTile(
            title: const Text('My Watch List'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyWatchList()),
              );
            },
          ),
        ],
      ),
    );
  }
}
