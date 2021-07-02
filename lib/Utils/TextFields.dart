import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aaaaaaaaaaaaaaaaaaa extends StatelessWidget {
  final String labelText;
  final String type;
  final String initialValue;
  final Function updateData;
  final valueSelected = new TextEditingController();
  aaaaaaaaaaaaaaaaaaa(
      this.labelText, this.type, this.updateData, this.initialValue);

  TextInputType getKeyboardType() {
    switch (type) {
      case "numbers":
        return TextInputType.number;
      case "alphaNumeric":
        return TextInputType.text;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      elevation: 30,
      child: TextField(
        controller: TextEditingController()
          ..text = initialValue == null ? "" : initialValue,
        textAlign: TextAlign.center,
        onChanged: (value) {
          updateData(labelText, value);
        },
        keyboardType: getKeyboardType(),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: new BorderSide(color: Colors.teal),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
