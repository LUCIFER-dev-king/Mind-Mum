import 'package:flutter/material.dart';
import 'package:mindmum/Screens/HomePage/HomePage.dart';
class Understanding extends StatefulWidget {
  final List list;
  Understanding({this.list});
  @override
   _UnderstandingState createState() => _UnderstandingState(this.list);
}
class _UnderstandingState extends State<Understanding> {
  final List list;
  _UnderstandingState(this.list);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title : Text("IDEAS"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(list: list,),));
        }
       ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                
              ),
            );
          },
        ),
      ),
    );

    
  }

  Container buildContainer(BuildContext context,IconData iconName,String titleName, IconData trailingName, Color colorName) {
     return Container(
              height: 80,
              child: Card(
                  child: ListTile(
                  contentPadding: EdgeInsets.only(top: 6),
                  leading: Icon(iconName,size: 50.0,color: Colors.white70),
                  title: Text(titleName,style: TextStyle(fontSize: 20,color: Colors.white),),
                  trailing: Icon(trailingName,size: 30.0,color: Colors.white54,),
                  onTap: (){
                    //_navigatToModules(context,titleName);
                  },
                ),
                shape: RoundedRectangleBorder(
                  borderRadius : BorderRadius.circular(5.0)
                ),
                color: colorName,
              ),
            );
   }
  
} 

// void _navigatToModules(BuildContext context,String className){
//    switch(className){
//      case "IDEAS":
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Ideas()));
//         break;
//      case "FEEL BETTER":
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Ideas()));
//         break;
//      case "SOLVE A PROBLEM":
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Ideas()));
//         break;
//      case "HOW I'M FEELING":
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Ideas()));
//         break;
//      case "MY GOOD TIMES":
//         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Ideas()));
//         break;
//    }
// }