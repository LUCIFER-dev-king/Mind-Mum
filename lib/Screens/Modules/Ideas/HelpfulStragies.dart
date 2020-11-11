import 'package:flutter/material.dart';
import 'package:mindmum/Screens/HomePage/HomePage.dart';
class HelpfulStragies extends StatefulWidget {
  final List list;
  HelpfulStragies({this.list});
  @override
   _HelpfulStragiesState createState() => _HelpfulStragiesState(list:list);
}
class _HelpfulStragiesState extends State<HelpfulStragies> {
  final List list;
  _HelpfulStragiesState({this.list});
   @override
   Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title : Text("Helpful Stragies"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(list: list,),));
        }
       ),
      ),
      body: Center(
        child: Text("Helpful Stragies"),
      ),
    );
  }
} 