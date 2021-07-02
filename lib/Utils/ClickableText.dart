import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class aaaaaaaaaaaaaaaaaaaaaaaaaaaaa extends StatelessWidget {
  final String text;
  final BuildContext cont;
  final String uid;
  final Map<String, dynamic> userMap;
  aaaaaaaaaaaaaaaaaaaaaaaaaaaaa(this.text, this.cont, this.uid, this.userMap);

  Future<void> navigate(BuildContext context) async {
    switch (text) {
      case "Sign Out":
        await FirebaseAuth.instance.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp()));
        break;
      default:
        break;
    }
  }

  Icon getIcon(String type) {
    switch (type) {
      case "Edit Account Details":
        return Icon(Icons.edit);
      case "View Ads":
        return Icon(Icons.view_carousel);
      case "Sign Out":
        return Icon(Icons.logout);
      default:
        return Icon(Icons.touch_app);
    }
  }

  Container getText(String type, BuildContext cont) {
    return Container(
      child: Text(
        type,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigate(context);
      },
      child: Row(
        children: <Widget>[
          getIcon(text),
          Flexible(child: getText(text, context)),
        ],
      ),
    );
  }
}
