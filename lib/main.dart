import 'package:flutter/material.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare_controls.dart';
//import 'package:flare_flutter/trim_path.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSE 3D"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Stack(
        children: <Widget>[
          Container(color:Colors.amber,
            child: Container(child: new FlareActor
              ("flare/Tedd2.flr",alignment: Alignment.center,animation: "success",),
     color: Colors.amber,margin: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0), ),
          ),
          Column(
            children: <Widget>[
              new CircleAvatar(
                child: new Icon(Icons.person)
              )
            ],
          ),
        ],
      )
    );
  }
}
