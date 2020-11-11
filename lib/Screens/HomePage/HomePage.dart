import 'package:flutter/material.dart';
import 'package:mindmum/FavouritesAndExplore/Favourites.dart';
import 'package:mindmum/OnboardingScreen/Onboarding.dart';
import 'package:mindmum/Screens/Modules/Ideas/Ideas.dart';
import 'package:mindmum/Screens/Modules/Ideas/Understanding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class IntroScreen extends StatefulWidget {
  @override
   _IntroScreenState createState() => _IntroScreenState();
}
class _IntroScreenState extends State<IntroScreen> {


   
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Onboarding()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(
        seconds: 1,
      ),(){
          checkFirstSeen();
      }
    );
  }
   
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
} 

class HomePage extends StatefulWidget {
  final List list;
  HomePage({this.list});
  @override
   _HomePageState createState() => _HomePageState(this.list);
}
class _HomePageState extends State<HomePage> {

  final List list;
  _HomePageState(this.list); 

  // final List<Favourties> favouritesList = [
  //   Favourties(listName: "Ideas",listCount: 1),
  //   Favourties(listName: "How I feeling",listCount: 2),
  //   Favourties(listName: "Solve a Problem",listCount: 3),
  //   Favourties(listName: "Feel Better",listCount: 4),
  //   Favourties(listName: "My good Time",listCount: 5),
  //   Favourties(listName: "Calm",listCount: 6),
  // ];
  List <int>_favourites = List<int>();
  var _firsthighest=1;
  var _secondHighest=1;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favourites.clear();
    
    list.forEach((element) {
      
              if(element!=null){
                
                if(_firsthighest < element.listCount){
                    setState(() {
                      _secondHighest=_firsthighest;
                      _firsthighest = element.listCount;
                      print(_firsthighest);
                    });
                }
              }
        });
        // print(list.indexOf(_firsthighest));
        // print(_secondHighest);
  //  _favourites.sort((a,b)=>b.compareTo(b));

    //_favourites[1]=_favourites[1]+1;
    // print(_favourites);
  }
   @override
   Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Logo"),
         centerTitle: true,
         actions: <Widget> [
           IconButton(
             icon: Icon(Icons.call, color: Colors.white,),
             onPressed: (){},
           )
         ],
       ),
       drawer: Drawer(
         child: ListView(
           padding: EdgeInsets.all(0),
           children: [
             DrawerHeader(
               child: Text("You Name"),
               decoration: BoxDecoration(
                 color: Colors.lightGreen
               ),
             ),
             BuildListTile(Icons.accessibility,"MODULES"),
             BuildListTile(Icons.new_releases,"MY LOGS"),
             BuildListTile(Icons.settings,"SETTINGS"),
             BuildListTile(Icons.call,"FAQ"),
             BuildListTile(Icons.exit_to_app,"LOGOUT"),
           ],
         ),
       ),
      //  body: Padding(
      //    padding: const EdgeInsets.all(10.0),
      //    child: Column(
      //      mainAxisAlignment: MainAxisAlignment.start,
      //      children: [
      //         Container(
      //             margin: EdgeInsets.only(top: 50,left: 8),
      //             alignment: Alignment.centerLeft,
      //             child: Text("Your Favourites", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      //         ),
      //         SizedBox(height: 10,),
      //         buildContainer(context,Icons.lightbulb_outline,"IDEAS",Icons.arrow_forward_ios,Colors.orangeAccent),
      //         SizedBox(height: 5,),
      //         buildContainer(context,Icons.thumb_up,"FEEL BETTER",Icons.arrow_forward_ios,Colors.indigo[800]),
      //         SizedBox(height: 5,),
      //         buildContainer(context,Icons.question_answer,"SOLVE A PROBLEM",Icons.arrow_forward_ios,Colors.redAccent),
      //         SizedBox(height: 5,),
      //         buildContainer(context,Icons.local_hospital,"HOW I'M FEELING",Icons.arrow_forward_ios,Colors.blueGrey),
      //         SizedBox(height: 5,),
      //         buildContainer(context,Icons.camera_alt,"MY GOOD TIMES",Icons.arrow_forward_ios,Colors.blueAccent),
      //      ],
      //    ),
      //  ),
      body: Column(
        children: [
          Text("Favourites"),
          Expanded(
            child: ListView.builder(
              itemCount: list.length-(list.length-2),
              itemBuilder: (context, index) {
                return Card(
                   child: list[index].listCount==_firsthighest ?ListTile(
                      onTap: (){
                        setState(() {
                          list[index].listCount++;
                          print(list[index].listCount);
                          //_secondHighest=list[index].listCount - 1;
                          //print(list[index].listCount);
                          _navigatToModules(context,list[index].listName,list);
                        });
                      },
                      title: Text(list[index].listName),    
                  ):SizedBox(height:0.0)
                );
              },
            ),
          ),
          Text("Explore"),
           Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                   child: list[index].listCount < _firsthighest+1 ?ListTile(
                      onTap: (){
                        setState(() {
                          print("$_firsthighest");
                          list[index].listCount++;
                          //print(list[index].listCount);
                          _navigatToModules(context,list[index].listName,list);
                                                  
                        });
                      },
                      title: Text(list[index].listName),    
                  ):SizedBox(height:0.0)
                );
              },
            ),
          ),
        ],
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


void _navigatToModules(BuildContext context,String className,List list){
   switch(className){
     case "Ideas":
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Understanding(list :list),));
        break;
     case "How I feeling":
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Understanding(list :list),));
        break;
     case "Solve a Problem":
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Understanding(list :list),));
        break;
     case "Feel Better":
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Understanding(list :list),));
        break;
     case "My good Time":
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Understanding(list :list),));
        break;
     case "Calm":
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Understanding(list :list),));
        break;
   }
}

class BuildListTile extends StatelessWidget {
  final IconData listIconName;
  final String listTitleName;
  
  BuildListTile(this.listIconName,this.listTitleName);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(listIconName),
      title: Text(listTitleName),
      onTap: (){},
    );
  }
} 