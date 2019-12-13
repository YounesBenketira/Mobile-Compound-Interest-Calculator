import 'package:finance_calculator/EntryProjectionTab.dart';
import 'package:flutter/material.dart';

import 'SimpleLineChart.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<TextEditingController> controllers = [
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
  ];

  List<Map<String, String>> values;

  void calculate() {
    setState(() {
      int startAge = int.parse(controllers[0].text);
      int engAge = int.parse(controllers[1].text);
      double principal = double.parse(controllers[2].text);
      double mIntRate = double.parse(controllers[3].text) / 100;
      double mAdditions = double.parse(controllers[4].text);

      List<Map<String, String>> temp = [
        {"index": "Age", "value": "Value"},
      ];

      double futureValue = principal * (1 + mIntRate) + mAdditions;
      int timePeriod = (engAge - startAge) * 12;

      for (int i = 1; i <= timePeriod; i++) {
        String age = (startAge + (i / 12)).toStringAsFixed(0);
        if (i % 12 == 0) {
          if (futureValue > 1000000000)
            continue;
          else
            temp.add({"index": age, "value": futureValue.toStringAsFixed(0)});
        }

        futureValue = futureValue * (1 + mIntRate) + mAdditions;
      }

      values = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Compound Interest Calculator",
                style: TextStyle(fontSize: 22),
              ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.reorder),
                ),
                Tab(icon: Icon(Icons.show_chart)),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            EntryProjectionTab(values, controllers, calculate),
            SimpleLineChart(values),
          ]),
        ),
      ),
    );
  }
}
