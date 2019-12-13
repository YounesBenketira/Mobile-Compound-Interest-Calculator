import 'package:flutter/material.dart';

class ProjectionCell extends StatelessWidget {
  final FontWeight _fontWeight;
  final String _result;
  final Color _labelColor;
  final IconData _iconData;

  ProjectionCell(
      this._result, this._fontWeight, this._labelColor, this._iconData);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        _result == "Age" || _result == "Value" ? Icon(_iconData) : Container(),
        Text(
          _result,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25, fontWeight: _fontWeight, color: _labelColor),
        ),
      ]),
    );
  }
}
