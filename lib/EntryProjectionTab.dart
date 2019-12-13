import 'package:finance_calculator/CalculateButton.dart';
import 'package:finance_calculator/EntryTable.dart';
import 'package:finance_calculator/ProjectionTable.dart';
import 'package:flutter/material.dart';

class EntryProjectionTab extends StatelessWidget {
  final List<TextEditingController> controllers;
  final Function calculate;
  final List<Map<String, String>> values;


  EntryProjectionTab(this.values, this.controllers, this.calculate);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        EntryTable(controllers),
        CalculateButton(calculate),
        ProjectionTable(values),
      ],
    );
  }
}
