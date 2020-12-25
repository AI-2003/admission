import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Start extends StatefulWidget {
  @override
  StartState createState() => StartState();
}

class StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          new ClipPath(
            clipper: StartClipper(),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x9989c2d9),
                    Color(0xFF01497c),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  new Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 35, left: 20),
                    child: new Text(
                      "ADMISSION \nTOOL",
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: "Rope",
                        fontWeight: FontWeight.w800,
                        fontSize: 33,
                      ),
                    ),
                  ),
                  //Hello
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(right: 40),
                        child: new Image(
                          height: 240,
                          image: AssetImage('assets/images/Frame1.png'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          new Container(
            height: 80,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFF01497c),
              boxShadow: [
                BoxShadow(
                  color: Color(0x9901497c),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Watch presentation again",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, size.height-80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}