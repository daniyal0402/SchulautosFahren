import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class aaaaaaaaaaaaaaaaaaaaaaa {
  Widget createLoading() {
    final spinkit = SpinKitWave(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.black : Colors.orange.shade500,
          ),
        );
      },
    );
    return spinkit;
  }
}
