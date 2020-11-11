import 'package:flutter/material.dart';
import 'package:mindmum/Screens/HomePage/HomePage.dart';
class WorkOnThoughts extends StatefulWidget {
  final List list;
  WorkOnThoughts({this.list});
  @override
   _WorkOnThoughtsState createState() => _WorkOnThoughtsState(list: list);
}
class _WorkOnThoughtsState extends State<WorkOnThoughts> {
  final List list;
  _WorkOnThoughtsState({this.list});
   @override
   Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title : Text("Work on thoughts"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(list: list,),));
        }
       ),
      ),
      body: Center(
        child: Text("Work on thoughts"),
      ),
    );
  }
} 