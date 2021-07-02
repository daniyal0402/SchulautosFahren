import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa extends StatelessWidget {
  final Function onPressed;
  final String text;
  final BuildContext context;
  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa(this.onPressed, this.text, this.context);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.orange.shade500.withOpacity(0.5);

                return Colors.orange.shade500; // Use the component's default.
              },
            ),
          ),
          child: Center(child: Text(text)),
          onPressed: () => onPressed(context),
        ),
      ],
    );
  }
}
