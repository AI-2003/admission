import 'package:admission_app/scripts/elements.dart';
import 'package:flutter/material.dart';
import 'start.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' show YoutubePlayer;
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Presentation extends StatefulWidget{
  @override 
  PresentationState createState() => PresentationState();
}

class PresentationState extends State<Presentation> {
  final ref = Firestore.instance;
  String link;
  String id;
  String text;
  YoutubePlayerController _controller;
  Color primary = Color(0xFF01497c);

  getLink() async{
    await ref.collection("pages").document("1").get().then((document){
      
      setState(() {
        link = document["link"];
        id = YoutubePlayer.convertUrlToId(link ?? "") ?? "";
        text = document["texto"];
      });
    });
    return link;
  }
  
  
  @override
  void initState() {
    super.initState();
    getLink();
  }

  @override 
  Widget build(BuildContext context) {
    print("TEstinggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg IDDDDDDDDDDDDDDDDDDDDD" + id);
    
  _controller = YoutubePlayerController(
    initialVideoId: id,
    params: YoutubePlayerParams(
      startAt: Duration(seconds: 00),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Color(0xFF01497c),
              size: 50,
            ),
            title: InkWell(
              child: Icon(
                Icons.west_rounded,
                color: Color(0xFF01497c),
                size: 30,
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Start()));
              },
            ),
          ),
        body: new Column(
          children: [
            Container(
              margin: EdgeInsets.only(top:10, left:5, right:5),
              decoration: BoxDecoration(
                color: Color(0xFFF9F9F9),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF000000),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ]
              ),
              child: YoutubePlayerControllerProvider( // Provides controller to all the widget below it.
                controller: _controller,
                child: YoutubePlayerIFrame(
                  aspectRatio: 16 / 9,
                ),
              )
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right:20, top:30, bottom:30),
                      child: Text(
                        text.replaceAll("\\n", "\n"),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: "Rope",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}