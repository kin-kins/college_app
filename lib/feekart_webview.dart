import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:core';

class Feekart extends StatefulWidget {
  @override
  _FeekartState createState() => _FeekartState();
}

class _FeekartState extends State<Feekart> {
  pop()
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
          url: "https://feekart.srmuniv.ac.in/srmopp",
          appBar: new AppBar(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(12,60,100,1.0),
            leading: FlatButton(onPressed: pop, child: Icon(Icons.arrow_back,color: Colors.white,),),
            title: new Text("Feekart", style: new TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.w500
            )),
          ),
        ),
      },
    );

  }
}
