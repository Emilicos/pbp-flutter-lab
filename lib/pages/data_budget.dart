import 'package:counter_7/widgets/drawer_opt.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/pages/add_budget.dart';

class MyDataBudgetPage extends StatefulWidget {
  const MyDataBudgetPage({super.key});

  @override
  State<MyDataBudgetPage> createState() => _MyDataBudgetPageState();
}

class _MyDataBudgetPageState extends State<MyDataBudgetPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: DrawerOpt(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            for(var i = 0; i < listBudget.length; i++)...[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: <Widget>[
                      new Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget> [
                              Text(listBudget[i].judul.toString(), style: TextStyle(fontSize: 24),),
                              Text(listBudget[i].date.toString()),
                            ],
                          ),
                        )
                      ),
                      new Container(
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(listBudget[i].nominal.toString()),
                              Text(listBudget[i].tipe.toString()),
                            ],
                          ),
                        )
                      )
                    ],
                  ),
                )
                          ]
              ]
        ),
      ),
    );
  }
}
