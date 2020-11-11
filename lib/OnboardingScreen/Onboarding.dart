
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mindmum/Authentication/AuthenticationIntroScreen.dart';

import 'SlidesData.dart';
class Onboarding extends StatefulWidget {
  @override
   _OnboardingState createState() => _OnboardingState();
}
class _OnboardingState extends State<Onboarding> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
     margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.black54,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

   @override
   Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(71, 138, 87, 1.0),
        body: Container(
          alignment: Alignment.topCenter,
          child: PageView(
            controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
          children: <Widget>[
            SlideTile(
              imagePath: mySLides[0].getImageAssetPath(),
              
            ),
            SlideTile(
              imagePath: mySLides[1].getImageAssetPath(),
              
            ),
            SlideTile(
              imagePath: mySLides[2].getImageAssetPath(),
              
            ),
          ],
          ),
        ),
        bottomSheet: slideIndex != 2 ? Container(
          color : Color.fromRGBO(82, 135, 46, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                splashColor: Colors.blue[50],
                child: Text(
                  "SKIP",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                  ],),
              ),
              FlatButton(
                onPressed: (){
                  print("this is slideIndex: $slideIndex");
                  controller.animateToPage(slideIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.linear);
                },
                splashColor: Colors.blue[50],
                child: Text(
                  "NEXT",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ): InkWell(
          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticationIntroScreen(),));
          },
          child: Container(
            height: Platform.isIOS ? 70 : 60,
            color: Color.fromRGBO(82, 135, 46, 1.0),
            alignment: Alignment.center,
            child: Text(
              "GET STARTED NOW",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath;

  SlideTile({this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child : Image.asset(imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
      )
    );
  }
}
