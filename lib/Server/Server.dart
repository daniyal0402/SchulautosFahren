import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class z {
  Future<void> zz(List<Map<String, dynamic>> adsMap) async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    firebase_storage.Reference ref;
    String dir;
    bool exists = false;
    for (int i = 0; i < adsMap.length; i++) {
      exists = await Directory(appDocDirectory.path + '/' + adsMap[i]['Ad ID'])
          .exists();
      if (!exists) {
        await Directory(appDocDirectory.path + '/' + adsMap[i]['Ad ID'])
            .create(recursive: true)
            .then((Directory directory) {
          dir = directory.path;
        });

        for (int j = 0; j < adsMap[i]['totalImages']; j++) {
          ref = storage
              .ref()
              .child(adsMap[i]["Ad ID"])
              .child("image" + j.toString());
          String url = await ref.getDownloadURL();
          await zzz(url, "image" + j.toString(), dir);
        }
      } else {
        print("already Present!");
      }
    }
  }

  Future<String> zzz(String url, String fileName, String dir) async {
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '';
    String myUrl = '';

    try {
      myUrl = url + '/' + fileName;
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      if (response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName';
        file = File(filePath);
        await file.writeAsBytes(bytes);
      } else
        filePath = 'Error code: ' + response.statusCode.toString();
    } catch (ex) {
      print(ex);
      filePath = 'Can not fetch url';
    }

    return filePath;
  }

  Future<List<Map<String, dynamic>>> zzzz() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Ads");
    List<String> adsList = new List<String>();
    List<Map<String, dynamic>> adsData = new List<Map<String, dynamic>>();

    await collectionReference
        .where("New", isEqualTo: "true")
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        adsList.add(element.id);
      });
    });
    adsData = await zzzzzz(adsList);
    // print(adsData[0]);
    return adsData;
  }

  Future<List<Map<String, dynamic>>> zzzzz() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Ads");
    List<String> adsList = new List<String>();
    List<Map<String, dynamic>> adsData = new List<Map<String, dynamic>>();

    await collectionReference.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        adsList.add(element.id);
      });
    });
    adsData = await zzzzzz(adsList);
    // print(adsData[0]);
    return adsData;
  }

  Future<List<Map<String, dynamic>>> zzzzzz(List<String> adsList) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Ads");
    List<Map<String, dynamic>> adsData = new List<Map<String, dynamic>>();

    for (int i = 0; i < adsList.length; i++) {
      await collectionReference.doc(adsList[i]).get().then((value) {
        adsData.add(value.data());
        adsData[adsData.length - 1]['Ad ID'] = adsList[i];
      });
    }
    return adsData;
  }

  void zzzzzzz(String token) {
    Map<String, dynamic> x = new Map<String, dynamic>();

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Owner");
    collectionReference.doc('owner').update({
      'token': FieldValue.arrayUnion([token])
    });
  }

  void zzzzzzzz(String adID) {
    Map<String, dynamic> x = new Map<String, dynamic>();
    x = {'New': 'false'};
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Ads");
    collectionReference.doc(adID).set(x, SetOptions(merge: true));
  }

  void zzzzzzzzz(String userID, String adID) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(userID);
    collectionReference.doc(adID).delete();
  }

  void zzzzzzzzzz(String adID) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Ads");
    collectionReference.doc(adID).delete();
  }

  void zzzzzzzzzzz(String adID, int numberOfImages) {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    firebase_storage.Reference ref;
    for (int i = 0; i < numberOfImages; i++) {
      ref = storage.ref().child(adID).child("image" + i.toString());
      ref.delete();
    }
  }
}
