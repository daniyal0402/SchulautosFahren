import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wirkaufendeinfahrschulautoowner/Routes/AllAds.dart';
import 'package:wirkaufendeinfahrschulautoowner/Routes/NewAds.dart';
import 'package:wirkaufendeinfahrschulautoowner/Server/Server.dart';
import 'package:wirkaufendeinfahrschulautoowner/Server/push_notifications.dart';

import 'Utils/Loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        canvasColor: Colors.blueGrey.shade900,
      ),
      home: aaaaaaaaaa(aaaaaa: 'Flutter Demo Home Page'),
    );
  }
}

class aaaaaaaaaa extends StatefulWidget {
  aaaaaaaaaa({Key key, this.aaaaaa}) : super(key: key);

  final String aaaaaa;

  @override
  aaaaaaaaa createState() => aaaaaaaaa();
}

class aaaaaaaaa extends State<aaaaaaaaaa> {
  bool a = false;
  bool aa = false;
  int aaa = 0;
  bool aaaa = false;
  Widget aaaaa;
  String aaaaaa = "neue Anzeigen";
  Widget aaaaaaa = aaaaaaaaaaaaaaaaaaaaaaa().createLoading();
  z aaaaaaaa = new z();
  List<Map<String, dynamic>> allAdsDataMapList =
      new List<Map<String, dynamic>>();
  List<Map<String, dynamic>> newAdsDataMapList =
      new List<Map<String, dynamic>>();
  List<Map<String, dynamic>> adsListMap = new List<Map<String, dynamic>>();
  @override
  void initState() {
    aaaa = true;
    aaaaaaaaaaaaaaa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (aa) {
      return Scaffold(
        body: Center(
          child: Text("ERROR"),
        ),
      );
    }

    if (!a) {
      return Scaffold(body: aaaaaaa);
    }

    return Scaffold(
      body: SafeArea(child: aaaa ? aaaaaaa : aaaaa),
      appBar: AppBar(
        title: Text(aaaaaa),
        centerTitle: true,
        toolbarHeight: 40,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            label: 'neue Anzeigen',
            // backgroundColor: Colors.black87,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.snippet_folder_outlined),
            label: 'alle Anzeigen',
            // backgroundColor: Colors.black87,
          ),
        ],
        currentIndex: aaa,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.orange.shade500,
        onTap: aaaaaaaaaaa,
      ),
    );
  }

  void aaaaaaaaaaa(int index) {
    switch (index) {
      case 0:
        setState(() {
          aaaaaa = "neue Anzeigen";
          aaa = index;
          aaaaa = zzzzzzzzzzzzzz(newAdsDataMapList);
        });
        break;
      case 1:
        setState(() {
          aaaaaa = "alle Anzeigen";
          aaa = index;
          aaaaa = zzzzzzzzzzzzz(allAdsDataMapList);
        });
        break;
    }
  }

  Future<String> get aaaaaaaaaaaa async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> aaaaaaaaaaaaa(String folder, String image) async {
    final path = await aaaaaaaaaaaa;
    return File('$path/$folder/$image');
  }

  Future<void> aaaaaaaaaaaaaa(
      List<Map<String, dynamic>> adsMap, bool newAdsOnly) async {
    for (int i = 0; i < adsMap.length; i++) {
      for (int j = 0; j < adsMap[i]['totalImages']; j++) {
        try {
          final file =
              await aaaaaaaaaaaaa(adsMap[i]['Ad ID'], "image" + j.toString());

          // Read the file.
          Uint8List contents = await file.readAsBytes();
          if (newAdsOnly)
            newAdsDataMapList[i]['Image' + j.toString()] = contents;
          else
            allAdsDataMapList[i]['Image' + j.toString()] = contents;
        } catch (e) {
          print(e);
          // If encountering an error, return 0.
          return e;
        }
      }
    }
  }

  void aaaaaaaaaaaaaaa() async {
    try {
      await Firebase.initializeApp().then((value) {
        print("Here");
      });
      setState(() {
        print("Initialized");
        a = true;
      });

      await FirebaseAuth.instance.signInAnonymously();
      allAdsDataMapList = await aaaaaaaa.zzzzz();
      await aaaaaaaa.zz(allAdsDataMapList);
      newAdsDataMapList = await aaaaaaaa.zzzz();
      await aaaaaaaaaaaaaa(allAdsDataMapList, false);
      await aaaaaaaaaaaaaa(newAdsDataMapList, true);
      PushNotificationManager().init(context);
      setState(() {
        print("accessing data");
        aaaa = false;
        aaaaa = zzzzzzzzzzzzzz(newAdsDataMapList);
      });
    } catch (e) {
      setState(() {
        print("ERROR");
        print(e);
        aa = true;
      });
    }
  }
}
