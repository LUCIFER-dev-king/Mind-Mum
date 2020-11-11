import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:io';
import 'dart:core';

import 'package:mindmum/Authentication/SignIn.dart';
import 'package:mindmum/Authentication/SignUp.dart';

class AuthenticationIntroScreen extends StatefulWidget {
  @override
   _AuthenticationIntroScreenState createState() => _AuthenticationIntroScreenState();
}
class _AuthenticationIntroScreenState extends State<AuthenticationIntroScreen> {

  final String logoSvg = "assets/svg/img_logo.svg";
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:40.0,right:25.0,left:25.0,bottom:80.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0,1.0),
                  blurRadius: 3.0
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:<Widget> [
                  Image(
                      image : AssetImage("assets/icon/img_logo.png"),
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.contain,
                  ),
                  // SvgPicture.asset(
                  //   logoSvg,
                  //   semanticsLabel: "LOGO",
                    // placeholderBuilder: (context)=> Image(
                    //   image : AssetImage("assets/icon/icon.png"),
                    //   width: 100.0,
                    //   height: 100.0,
                  //   ),
                  // ),
                  SizedBox(height: 30.0),
                  buildText("This app is for all women who are pregnant or have just given birth."),
                  SizedBox(height: 30.0),
                  buildText("Being pregnant and having a baby are big life changes."),
                  SizedBox(height: 30.0),
                  buildText("As well as excitement and joy, it's common to have mixed emotions: uncertainty, and even worry and sadness. This app can help you understand your emotions."),
                  SizedBox(height: 30.0),
                  buildText("Explore this app which has lots of ideas to guide you on you way with more confidence."),
                  Padding(
                    padding: const EdgeInsets.only(top : 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget> [
                        Image(
                           image : AssetImage("assets/icon/have_baby_profile.png"),
                           width: 100.0,
                           height: 100.0,
                        ),
                        Image(
                           image : AssetImage("assets/icon/pregnant_profile.png"),
                           width: 100.0,
                           height: 100.0,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),     
      bottomSheet: Container(
        decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0,1.0),
                  blurRadius: 10.0
                )
              ]
            ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(),));
                    },
                    color: Colors.green[400],
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(width: 80.0,),
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                    },
                    color: Colors.green[400],
                    child: Text(
                      "NEW USER",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  
                ]
          ),
        ),
      ),
    );
  }

   Text buildText(String text) {
     return Text(
          text,
          style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400
         ),
        );
   }
} 