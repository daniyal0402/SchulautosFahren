import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wirkaufendeinfahrschulautoowner/Server/Server.dart';
import 'package:wirkaufendeinfahrschulautoowner/main.dart';

class PushNotificationManager {
  PushNotificationManager._();

  factory PushNotificationManager() => _instance;

  static final PushNotificationManager _instance = PushNotificationManager._();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init(BuildContext context) async {
    if (!_initialized) {
      // For iOS request permission first.
      // _firebaseMessaging.requestNotificationPermissions();
      // _firebaseMessaging.configure();
      z server = new z();
      String token = await _firebaseMessaging.getToken();
      server.zzzzzzz(token);

      _initialized = true;
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        showCupertinoDialog(
            context: context,
            builder: (_) => CupertinoAlertDialog(
                  title: Text("neue Anzeige"),
                  content: Text(
                      "Jemand hat eine neue Anzeige geschaltet. Möchten Sie den Bildschirm neu laden?"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                          (route) => false),
                      child: Text("Ja"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () =>
                          Navigator.of(context, rootNavigator: true)
                              .pop("Discard"),
                      child: Text("Nein"),
                    ),
                  ],
                ));
      });
    } else {
      print("LULLLLLLLLLLL token: ");
    }
  }
}
