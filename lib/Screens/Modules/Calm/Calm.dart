import 'package:flutter/material.dart';
import 'package:mindmum/Screens/HomePage/HomePage.dart';
class Calm extends StatefulWidget {
  final List list;
  Calm({this.list});
  @override
   _CalmState createState() => _CalmState(list: list);
}
class _CalmState extends State<Calm> {
  final List list;
  _CalmState({this.list});
   @override
   Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title : Text("Calm"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(list: list,),));
        }
       ),
      ),
      body: Center(
        child: Text("Calm"),
      ),
    );
  }
} 