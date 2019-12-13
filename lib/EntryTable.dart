import 'package:finance_calculator/EntryRow.dart';
import 'package:flutter/material.dart';

class EntryTable extends StatelessWidget {
  final List<TextEditingController> controllers;

  EntryTable(this.controllers);

  @override
  Widget build(BuildContext context) {
    var row1 = [
      {
        "label": "Starting Age",
        "hint": "e.g. 20 years old",
        "controller": controllers[0]
      },
      {
        "label": "Ending Age",
        "hint": "60 years old",
        "controller": controllers[1]
      }
    ];

    final row2 = [
      {
        "label": "Starting Principle",
        "hint": "e.g. \$2000",
        "controller": controllers[2]
      }
    ];

    final row3 = [
      {
        "label": "Monthly Additions",
        "hint": "e.g. \$500",
        "controller": controllers[4]
      },
      {
        "label": "Monthly Interest %",
        "hint": "e.g. \%2",
        "controller": controllers[3]
      }
    ];

    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 10,
        ),
        EntryRow(row1),
        EntryRow(row2),
        EntryRow(row3),
        Container(
          width: double.infinity,
          height: 10,
        ),
      ],
    );
  }
}
