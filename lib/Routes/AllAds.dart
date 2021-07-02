import 'package:flutter/widgets.dart';
import 'package:wirkaufendeinfahrschulautoowner/Utils/AdsDisplayBuild.dart';

class zzzzzzzzzzzzz extends StatefulWidget {
  final List<Map<String, dynamic>> adsMapList;

  zzzzzzzzzzzzz(this.adsMapList);
  @override
  State<StatefulWidget> createState() => zzzzzzzzzzzzzzzz(adsMapList);
}

class zzzzzzzzzzzzzzzz extends State<zzzzzzzzzzzzz> {
  List<Map<String, dynamic>> adsMapList;
  zzzzzzzzzzzzzzzz(this.adsMapList);
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
