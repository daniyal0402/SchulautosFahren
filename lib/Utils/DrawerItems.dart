import 'package:flutter/material.dart';

import 'ClickableText.dart';

class aaaaaaaaaaaaaaaaaaaaaaaaaaa extends StatelessWidget {
  Divider aaaaaaaaaaaaaaaaaaaaaaaaa() {
    return Divider(
      color: Colors.teal,
      height: 15,
      thickness: 2,
      indent: 10,
      endIndent: 10,
    );
  }

  final String uid;
  final Map<String, dynamic> userMap;
  aaaaaaaaaaaaaaaaaaaaaaaaaaa(this.uid, this.userMap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 350,
      ),
      body: ListView(
        children: <Widget>[
          aaaaaaaaaaaaaaaaaaaaaaaaa(),
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaa(
              "Edit Account Details", context, uid, userMap),
          aaaaaaaaaaaaaaaaaaaaaaaaa(),
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaa("View Ads", context, uid, userMap),
          aaaaaaaaaaaaaaaaaaaaaaaaa(),
          aaaaaaaaaaaaaaaaaaaaaaaaaaaaa("Sign Out", context, uid, userMap),
          aaaaaaaaaaaaaaaaaaaaaaaaa(),
        ],
      ),
    );
  }
}
