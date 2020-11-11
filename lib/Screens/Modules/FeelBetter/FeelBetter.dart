import 'package:flutter/material.dart';
import 'package:mindmum/Screens/HomePage/HomePage.dart';
class FeelBetter extends StatefulWidget {
  final List list;
  FeelBetter({this.list});
  @override
   _FeelBetterState createState() => _FeelBetterState(list: list);
}
class _FeelBetterState extends State<FeelBetter> {
  final List list;
  _FeelBetterState({this.list});
   @override
   Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title : Text("Feel Better"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(list: list,),));
        }
       ),
      ),
      body: Center(
        child: Text("Feel Better"),
      ),
    );
  }
} 