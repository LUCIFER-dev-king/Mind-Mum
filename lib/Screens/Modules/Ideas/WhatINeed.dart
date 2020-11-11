import 'package:flutter/material.dart';
import 'package:mindmum/Screens/HomePage/HomePage.dart';
class WhatINeed extends StatefulWidget {
  final List list;
  WhatINeed({this.list});
  @override
   _WhatINeedState createState() => _WhatINeedState(list:list);
}
class _WhatINeedState extends State<WhatINeed> {
  final List list;
  _WhatINeedState({this.list});
   @override
   Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title : Text("What I need"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(list: list,),));
        }
       ),
      ),
      body: Center(
        child: Text("What I need"),
      ),
    );
  }
} 