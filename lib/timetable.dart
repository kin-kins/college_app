import 'dart:async';
import 'package:flutter/src/services/platform_channel.dart';
import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cse_d/erp_webview.dart';
import 'package:cse_d/feekart_webview.dart';
import 'package:cse_d/flieManager.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth= FirebaseAuth.instance;
final  GoogleSignIn _googleSignIn= new GoogleSignIn();
class HomeCards extends StatefulWidget
{
  @override
  _HomeCardsState createState() => _HomeCardsState();
}

class _HomeCardsState extends State<HomeCards> {
  @override
 void initState()
  {
    super.initState();
    dataPath();
    print("inside ------------------ $image2");
  }

  TextStorage ob=new TextStorage();
  String userName="Guest";
  File image;
  File image2;
  Color dynamicColor = Color.fromRGBO(12, 60, 100, 1.0);
  List<Color> range = [
    Color.fromRGBO(12, 60, 100, 1.0),
    Colors.redAccent,
    Colors.black26
  ];

  var controller = new PageController(initialPage: 0, keepPage: true, viewportFraction: 0.7);

  //HomeCards(Color.fromRGBO(12,60,100,1.0));

  Future _erp(BuildContext context) async {
    await Navigator.of(context).push(new MaterialPageRoute<Map>(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return new Erp();
        }));
  }

  Future _feekart(BuildContext context) async {
    await Navigator.of(context)
        .push(new MaterialPageRoute<Map>(builder: (BuildContext context) {
      return new Feekart();
    }));
  }

  Widget routine()
  {
    return Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)),
    child: Column(
           //mainAxisSize: MainAxisSize.min,
           children: <Widget>[
             image==null?Container(height: 300.0,width: 380.0,color: Colors.orangeAccent,child: Image.asset("/Users/ashukumar/IdeaProjects/cse_d/flare/timetable.jpg"),):Container(height: 300.0,width: 380.0,color: Colors.orangeAccent,child:Image.file(image)),
             Padding(padding: EdgeInsets.all(5.0)),
             const ListTile(
               leading: Icon(Icons.album),
               title: Text('Add Time Table',style: TextStyle(fontSize: 22.0),),
               subtitle: Text('Select the Time Table Image from Gallery or Click A photo',style: TextStyle(fontSize: 16.0),),
             ),
             ButtonTheme.bar( // make buttons use the appropriate styles for cards
               child: ButtonBar(
                 alignment: MainAxisAlignment.end,
                 children: <Widget>[
                   FlatButton(
                     child: Icon(Icons.folder_open,size: 35.0,),
                     onPressed: () { imageFromGallery();},
                   ),
                   FlatButton(
                     child: Icon(Icons.camera_enhance,size: 35.0,),
                     onPressed: () { /* ... */ },
                   ),
                 ],
               ),
    ),
    ]
    )
    );
  }


  Widget todo() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
      ),
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(height: 300,width: 380,color: Colors.orangeAccent,),
            Positioned(
              child: Text(
                'Routine',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              left: 10.0,
              top: 20.0,
            )
          ],
        ),
        Flexible(
          child: ListView(
            children: <Widget>[
              Text(
                'A',
                style: TextStyle(fontSize: 18.0),
              ),
              Divider(
                height: 10.0,
                color: Colors.blue,
              ),
              Text(
                'B',
                style: TextStyle(fontSize: 18.0),
              ),
              Divider(height: 10.0, color: Colors.blue),
            ],
          ),
        ),
      ],
    ),
    );
  }

  num tim = 5;


  Widget card(Widget tempWidget) {
    return Center(
      child: Container(
        height: 500.0,
        width: 380.0,
        padding: EdgeInsets.only(bottom: 30.0),
        child:  tempWidget,
        ),
    );
  }

  Widget pageCard(BuildContext context) {
    controller.addListener(() {
      setState(() {
        //controller.animateToPage(controller.page, duration: 3.0, curve:Curve. );
        // print(controller.page.toInt());
        dynamicColor = range[controller.page.round()];
        print(controller.page.toInt().round());
      });
    });

    return Container(
      color: dynamicColor,
      child: new PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        pageSnapping: false,
        children: <Widget>[
         card(routine()),
          card(todo()),
          card(Container(
            color: Colors.black,
          )),
        ],
        onPageChanged: updatetim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: dynamicColor,
          title: new Text("Trial",
              style:
                  new TextStyle(fontSize: 26.0, fontWeight: FontWeight.w500)),
        ),
        body: SafeArea(child: pageCard(context)),
        drawer: Drawer(
            child: Container(
          color: Color.fromRGBO(12, 60, 100, 1.0),
          padding: EdgeInsets.fromLTRB(7.0, 0.0, 15.0, 0.0),
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            DrawerHeader(
              child: new Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(margin:EdgeInsets.only(left: 170.0),
                        child: new FlatButton(onPressed: _gSignIn,
                      child: new Text("login", textDirection: TextDirection.rtl,
                        style: new TextStyle(
                          color: Colors.white70,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w200,),)
                      ,)),

                    new CircleAvatar(
                      child: Icon(Icons.person,color: Colors.white70,size: 30.0,),
                      radius: 30.0,

                    ),
            new Padding(padding: EdgeInsets.all(4.0)),
            new Text("$userName", style: new TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.w400),)
                  ],
                )
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(12, 60, 100, 1.0),
              ),
            ),
            ListTile(
              title: new Text(
                "ERP",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
              onTap: () {
                _erp(context);
              },
            ),
            Divider(
              height: 0.2,
              indent: 0.7,
              color: Color.fromRGBO(160, 200, 253, 1.0),
            ),
            ListTile(
              title: new Text("Fee Kart",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0)),
              onTap: () {
                _feekart(context);
              },
            ),
          ]),
        )));
  }

  updatetim() {
    setState(() {
      tim = tim - 1;
      //dynamicColor=range[controller.page.toInt()+1];
    });
  }

  void imageFromGallery() async
  {
  image=await ImagePicker.pickImage(source: ImageSource.gallery);
  print(image);
  final directory=await getApplicationDocumentsDirectory();
  ob.writeFile("$image");
 print (await ob.readFile());
 // print("${directory.path} await ob.readFile());

  setState(() {
});
  }

  Future dataPath() async{
    File imageTemp= new File(await ob.readFile());
    image2=imageTemp;
    print("this.............$image2");
    image2=imageTemp;
    image=image2;
  }

 Future <FirebaseUser> _gSignIn() async
 {
   print ("-----------------------");
 GoogleSignInAccount googleSignInAccount= await _googleSignIn.signIn();
 GoogleSignInAuthentication googleSignInAuthentication= await googleSignInAccount.authentication;
 final AuthCredential credential = GoogleAuthProvider.getCredential(
   accessToken: googleSignInAuthentication.accessToken,
   idToken: googleSignInAuthentication.idToken,
 );
 final FirebaseUser user = await _auth.signInWithCredential(credential);
   assert(user.email != null);
   assert(user.displayName != null);
   assert(!user.isAnonymous);
   assert(await user.getIdToken() != null);

   final FirebaseUser currentUser = await _auth.currentUser();
   assert(user.uid == currentUser.uid);

   return user;
  }

}
