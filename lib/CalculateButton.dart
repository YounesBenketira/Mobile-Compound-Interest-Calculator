import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CalculateButton extends StatelessWidget {
  final Function calculate;

  CalculateButton(this.calculate);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 125, right: 125),
      child: Container(
        height: 40,
        child: FloatingActionButton.extended(
          label: Text(
            "Calculate",
          ),
          onPressed: () {
            try {
              calculate();
            } on FormatException {
              Alert(
                image: Image.asset('images/ErrorV2.gif'),
                context: context,
                title: "Encountered Error!",
                desc: "All values entered must be numbers!",
                buttons: [
                  DialogButton(
                    child: Text(
                      "TRY AGAIN",
                      style: TextStyle(color: Colors.white, fontSize: 17.5),
                    ),
                    onPressed: () => Navigator.pop(context),
                    width: 120,
                    color: Colors.blueAccent,
                  )
                ],
              ).show();
            }
          },
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
