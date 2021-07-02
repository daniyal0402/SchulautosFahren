import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wirkaufendeinfahrschulautoowner/Routes/ViewPdf.dart';
import 'package:wirkaufendeinfahrschulautoowner/Server/Server.dart';
import 'package:wirkaufendeinfahrschulautoowner/Utils/Buttons.dart';
import 'package:wirkaufendeinfahrschulautoowner/Utils/ShowFullImage.dart';
import 'package:wirkaufendeinfahrschulautoowner/main.dart';

class zzzzzzzzzzzz extends StatefulWidget {
  final int index;
  final List<Map<String, dynamic>> adsMapList;
  zzzzzzzzzzzz(this.index, this.adsMapList);
  @override
  State<StatefulWidget> createState() => AdsBuildState(index, adsMapList);
}

//images is a list of unit8list images
//adsMapList has all textual data
class AdsBuildState extends State<zzzzzzzzzzzz> {
  final int index;
  final List<Map<String, dynamic>> adsMapList;
  AdsBuildState(this.index, this.adsMapList);
  List<Uint8List> images = new List<Uint8List>();
  z server = new z();

  @override
  void initState() {
    for (int i = 0; i < adsMapList[index]['totalImages']; i++) {
      images.add(adsMapList[index]['Image' + i.toString()]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueGrey.shade100,
      color: Colors.blueGrey.shade700,
      margin: EdgeInsets.all(20),
      elevation: 5,
      child: ListView(
        children: [
          Column(
            children: [
              Card(
                elevation: 10,
                shadowColor: Colors.blueGrey.shade100,
                color: Colors.blueGrey.shade700,
                margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: GridView.count(
                    mainAxisSpacing: 5,
                    dragStartBehavior: DragStartBehavior.start,
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    children: List.generate(images.length, (index) {
                      return InkWell(
                        onTap: () {
                          showFullImage(images[index]);
                        },
                        highlightColor: Colors.black,
                        focusColor: Colors.black,
                        child: Image.memory(
                          images[index],
                          width: 200,
                          height: 300,
                          fit: BoxFit.fill,
                          colorBlendMode: BlendMode.exclusion,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Table(
                border: TableBorder(
                  top: BorderSide(
                    width: 5,
                    color: Colors.orange.shade500,
                  ),
                  bottom: BorderSide(
                    width: 5,
                    color: Colors.orange.shade500,
                  ),
                ),
                children: [
                  getTableRow(index, "Pries"),
                  getTableRow(index, "Abdabe Datum"),
                  getTableRow(index, "Mehrwersteuer"),
                ],
              ),
              getHeading("Autodetails"),
              Card(
                child: getCarDetailsTable(index),
                color: Colors.blueGrey.shade700,
              ),
              getHeading("Kontodetails"),
              Card(
                child: getCustomerDetailsTable(index),
                color: Colors.blueGrey.shade700,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 5),
              Expanded(
                flex: 4,
                child: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa(
                    markAsRead, "Mark As Read", context),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 4,
                child: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa(viewPDF, "PDF", context),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onPressed: () => showCupertinoDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: Text("Anzeige löschen"),
                      content:
                          Text("Möchten Sie diese Anzeige wirklich löschen?"),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: deleteConfirm,
                          child: Text("Ja"),
                        ),
                        CupertinoDialogAction(
                          onPressed: () =>
                              Navigator.of(context, rootNavigator: true)
                                  .pop("Discard"),
                          child: Text("Nein"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
            ],
          ),
        ],
      ),
    );
  }

  void viewPDF(BuildContext cont) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                zzzzzzzzzzzzzzzzz(images, adsMapList[index], context)));
  }

  void markAsRead(BuildContext cont) {
    server.zzzzzzzz(adsMapList[index]['Ad ID']);
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => MyApp()), (route) => false);
  }

  void deleteConfirm() {
    server.zzzzzzzzzz(adsMapList[index]['Ad ID']);
    server.zzzzzzzzz(adsMapList[index]['userID'], adsMapList[index]['Ad ID']);
    server.zzzzzzzzzzz(
        adsMapList[index]['Ad ID'], adsMapList[index]['totalImages']);
    Navigator.of(context, rootNavigator: true).pop("Discard");
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => MyApp()), (route) => false);
  }

  void showFullImage(Uint8List img) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => aaaaaaaaaaaaaaaaaaaaa(img)));
  }

  Widget getHeading(String heading) {
    return Card(
      color: Colors.white10,
      child: Text(
        heading,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Table getCustomerDetailsTable(int index) {
    return Table(
      border: TableBorder.all(
        color: Colors.orange.shade500,
      ),
      children: [
        getTableRow(index, "Fahrschule/Firma Name"),
        getTableRow(index, "Adresse Str Hr"),
        getTableRow(index, "PLZ"),
        getTableRow(index, "Ort"),
        getTableRow(index, "Telefon / Handynummer"),
        getTableRow(index, "Email"),
        getTableRow(index, "Ansprechpartner"),
      ],
    );
  }

  Table getCarDetailsTable(int index) {
    return Table(
      border: TableBorder.all(
        color: Colors.orange.shade500,
      ),
      children: [
        getTableRow(index, "Marke"),
        getTableRow(index, "Model"),
        getTableRow(index, "Erstzulassung"),
        getTableRow(index, "Bauform"),
        getTableRow(index, "Modellvariante"),
        getTableRow(index, "Typ"),
        getTableRow(index, "Kilometer"),
      ],
    );
  }

  TableRow getTableRow(int index, String title1) {
    return TableRow(
      children: <Widget>[
        getRow(index, title1),
      ],
    );
  }

  Row getRow(int index, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Text(
              title + ": ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
            child: Text(
              adsMapList[index][title],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageHolder {
  Uint8List image;
  ImageHolder();
}
