import 'package:counter_7/pages/my_watchlist_detail.dart';
import 'package:counter_7/utils/fetchMyWatchList.dart';
import 'package:counter_7/widgets/drawer_opt.dart';
import 'package:flutter/material.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({Key? key}) : super(key: key);

  @override
  State<MyWatchList> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchList> {
  bool is_checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: const DrawerOpt(),
      body: FutureBuilder(
        future: fetchMyWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak Watch List yang Dibuat :(",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, i) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        padding: const EdgeInsets.all(20.0),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: listMyWatchListTotal[i].fields.watched
                                  ? Colors.green
                                  : Colors.red,
                              blurRadius: 2.0)
                        ]),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyWatchListDetail(
                                      myWatchList: listMyWatchListTotal[i])),
                            );
                          },
                          child: Row(
                            children: [
                              Checkbox(
                                  value: listMyWatchListTotal[i].fields.watched,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      listMyWatchListTotal[i].fields.watched =
                                          value!;
                                    });
                                  }),
                              Text(
                                "${snapshot.data![i].fields.title}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
            }
          }
        },
      ),
    );
  }
}
