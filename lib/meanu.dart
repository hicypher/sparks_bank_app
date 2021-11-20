import 'dart:io';

import 'package:bank_sparks/history.dart';
import 'package:bank_sparks/profile.dart';
import 'package:bank_sparks/setting.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

late List<dynamic> tools = ["Profile","History","Setting"];
class PdfList extends StatefulWidget {
  const PdfList({Key? key}) : super(key: key);

  @override
  _PdfListState createState() => _PdfListState();
}

class _PdfListState extends State<PdfList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.black,
      title: new Text("Account Page",
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 20.0)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          tooltip: 'Menu Icon',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: tools.length,
            itemBuilder: (BuildContext context,int index){
              return ListTile(onTap: ()=>ViewExcel(context, index),
                //leading: Icon(Icons.picture_as_pdf),
                title: Text(basename(tools[index].toString()),
                  style: TextStyle(
                      color: Colors.black,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_rounded),
              );
            }
        ),
      ),
    ));
  }
  void ViewExcel(BuildContext context, int file) {
    if(file==0){
      Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
    }
    if(file==1){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HistoryPage()),
      );
    }
    if(file==2){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
    }
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => ViewRow(a: file)),
        // );
  }
}
