import 'package:flutter/material.dart';

class EntryRow extends StatelessWidget {
  final List<Map<String, Object>> entries;

  EntryRow(this.entries);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ...(entries).map((entry) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 17),
                  controller: entry["controller"],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: entry["label"],
                      labelStyle: TextStyle(color: Colors.green),
                      hintText: entry["hint"],
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.green, width: 1),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)))),
            ),
          );
        }).toList(),
      ],
    );
  }
}
