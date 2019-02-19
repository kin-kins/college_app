import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:core';

class Erp extends StatefulWidget {
  @override
  _ErpState createState() => _ErpState();
}

class _ErpState extends State<Erp> {
  void pop()
  {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (_) => new WebviewScaffold(
          withZoom: true,
          hidden: true,
          scrollBar: false,
          url: "http://evarsity.srmuniv.ac.in/srmsip",
          appBar: new AppBar(
            centerTitle: true,
        backgroundColor: Color.fromRGBO(12,60,100,1.0),
        leading: FlatButton(onPressed: pop, child: Icon(Icons.arrow_back,color: Colors.white,),),
        title: new Text("ERP", style: new TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500
        )),
          ),
        ),
      },
    );

  }
}
