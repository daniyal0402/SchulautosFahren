import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wirkaufendeinfahrschulautoowner/Utils/AdsDisplayBuild.dart';

class zzzzzzzzzzzzzz extends StatefulWidget {
  final List<Map<String, dynamic>> adsMapList;
  zzzzzzzzzzzzzz(this.adsMapList);
  @override
  State<StatefulWidget> createState() => zzzzzzzzzzzzzzz(adsMapList);
}

class zzzzzzzzzzzzzzz extends State<zzzzzzzzzzzzzz> {
  List<Map<String, dynamic>> adsMapList;
  zzzzzzzzzzzzzzz(this.adsMapList);
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageView.builder(
          itemCount: adsMapList.length,
          itemBuilder: (context, index) => zzzzzzzzzzzz(index, adsMapList),
        ),
      ],
    );
  }
}
