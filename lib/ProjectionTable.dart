import 'package:finance_calculator/ProjectionRow.dart';
import 'package:flutter/material.dart';

class ProjectionTable extends StatelessWidget {
  final List<Map<String, String>> resultList;

  ProjectionTable(this.resultList);

  @override
  Widget build(BuildContext context) {
    if (resultList != null)
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Table(
            children: [
              ...resultList.map((entry) {
                return TableRow(children: [
                  TableCell(
                    child: ProjectionRow(entry["index"],entry["value"]),
                  )
                ]);
              }).toList(),
            ]),
      );
    else{
      return Text("");
    }

  }
}