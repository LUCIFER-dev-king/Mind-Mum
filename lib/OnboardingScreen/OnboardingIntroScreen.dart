import 'package:flutter/material.dart';
import 'package:mindmum/FavouritesAndExplore/Favourites.dart';
import 'package:mindmum/Screens/HomePage/HomePage.dart';
import 'package:mindmum/Screens/Modules/Calm/Calm.dart';
import 'package:mindmum/Screens/Modules/FeelBetter/FeelBetter.dart';
import 'package:mindmum/Screens/Modules/Ideas/HelpfulStragies.dart';
import 'package:mindmum/Screens/Modules/Ideas/Ideas.dart';
import 'package:mindmum/Screens/Modules/Ideas/Understanding.dart';
import 'package:mindmum/Screens/Modules/Ideas/WhatINeed.dart';
import 'package:mindmum/Screens/Modules/Ideas/WorkOnThoughts.dart';
class OnboardingIntroScreen extends StatefulWidget {
  @override
   _OnboardingIntroScreenState createState() => _OnboardingIntroScreenState();
}
class _OnboardingIntroScreenState extends State<OnboardingIntroScreen> {

  List<Favourties> favouritesList = [
    Favourties(listName: "Ideas",listCount: 0),
    Favourties(listName: "How I feeling",listCount: 0),
    Favourties(listName: "Solve a Problem",listCount: 0),
    Favourties(listName: "Feel Better",listCount: 0),
    Favourties(listName: "My good Time",listCount: 0),
    Favourties(listName: "Calm",listCount: 0),
  ];

  List<String> _listName = ["Learn about feelings",
            "Learn about helpful strategies",
            "Work on my thoughts",
            "Learn some useful tips",
            "Learn some useful tips",
            "Explore activities to feel beeter",
            "Relax and calm down"
        ];

List<bool> _selectedColor = List.generate(20, (i) => false);
bool disableContinueButton= false;
var tempButtonState; 
var selectedListName;

   @override
   Widget build(BuildContext context) {
    return Scaffold(
 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:40.0,right:25.0,left:25.0,bottom:80.0),
          child: Container(
             margin: EdgeInsets.only(top: 20.0),
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
              padding:const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                        SizedBox(height: 10.0,),
                        Image(
                            image : AssetImage("assets/icon/img_logo.png"),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.contain,
                        ),
                        SizedBox(height: 20.0),
                        Text("What would you like to do today?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:14
                          ),
                          textAlign: TextAlign.center,
                        ),
                  Expanded(
                      child: ListView.builder(
                        itemCount: _listName.length,
                        itemBuilder: (_, i) {
                          return Card(
                             child: Container(
                              color: _selectedColor[i] ? Colors.green[400] : null, // if current item is selected show blue color
                              child: ListTile(
                                 contentPadding: EdgeInsets.only(left:15,right: 5),
                                 title: Text(_listName[i],style: TextStyle(fontSize: 16,color: Colors.black),),
                                 trailing: Icon(Icons.arrow_forward_ios,size: 15.0,color: Colors.black,),
                                 onTap: () {
                                   print(favouritesList[1].listName);
                                   setState((){
                                     for(int j=0;j<_listName.length;j++){
                                       if(j!=i){
                                          if(_selectedColor[j]==true){
                                            setState(() {
                                              _selectedColor[j] = false;
                                            });
                                          }
                                       }
                                     }
                                     _selectedColor[i] = !_selectedColor[i];
                                     

                                     /*TODO: disableContinueButton is working (BUG) even after setting the state to false, 
                                       the button color don't to disabled when user click on the same Tile again.*/

                                     if(tempButtonState==i){
                                       setState(() {
                                         disableContinueButton= !disableContinueButton;
                                       });
                                     }
                                     disableContinueButton=true;
                                     selectedListName=_listName[i];
                                     tempButtonState=i;
                                   });
                                   
                                 }, 
                              ),
                            ),
                           shape: RoundedRectangleBorder(
                              borderRadius : BorderRadius.circular(5.0),
                              side: BorderSide(
                              color: Colors.black.withOpacity(0.2),
                              width: 1,
                             )
                            ),
                          );
                        },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet : Container(
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
        child: Container(
          padding:const EdgeInsets.all(5.0),
             height: 50.0,
             child: Material(
              color: Colors.green[400],
              elevation: 7.0,
               child: MaterialButton(
                disabledColor: Colors.green[200],
                minWidth: double.infinity,
                onPressed: disableContinueButton? (){
                  navigatorToModules(context,selectedListName,favouritesList);
                }:null,
                child: Text(
                 'CONTINUE',
                   style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                    fontSize: 15
                  )
                 )
              )
             ),
          ),
      ),
    );
  }

 
} 

void navigatorToModules(BuildContext context,String moduleName,List favouritesList){
  if(moduleName=="Learn about feelings"){
    favouritesList[0].listCount++;
    Navigator.push(context, MaterialPageRoute(builder: (context) => Understanding(list :favouritesList),));
  }
  if(moduleName=="Learn about helpful strategies"){
    favouritesList[0].listCount++;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpfulStragies(list : favouritesList),));
  }
  if(moduleName=="Work on my thoughts"){
    favouritesList[0].listCount++;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkOnThoughts(list : favouritesList),));
  }
  if(moduleName=="Learn some useful tips"){
    favouritesList[0].listCount++;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WhatINeed(list : favouritesList),));
  }
  if(moduleName=="Explore activities to feel beeter"){
    favouritesList[3].listCount++;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeelBetter(list : favouritesList),));
  }
  if(moduleName=="Relax and calm down"){
    favouritesList[5].listCount++;
    //print(favouritesList[5].listCount);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Calm(list : favouritesList),));
  }
}


/*Expanded(
                          child : ListView.builder(
                            itemCount: _listName.length,
                            itemBuilder: (context, index) {
                                  return Card(
                                    child: Container(
                                      color: _selectedColor[index]?Colors.green[400]:null,
                                        child: ListTile(
                                        contentPadding: EdgeInsets.all(5),
                                        title: Text(_listName[index],style: TextStyle(fontSize: 16,color: Colors.black),),
                                        trailing: Icon(Icons.arrow_forward_ios,size: 15.0,color: Colors.black,),
                                        onTap: (){
                                          //navigatorToModules(context,title);
                                          setState(() {
                                            _selectedColor[index] =!_selectedColor[index];
                                          });
                                      },
                                    ),
                                    ),
                                  shape: RoundedRectangleBorder(
                                  borderRadius : BorderRadius.circular(5.0),
                                  side: BorderSide(
                                      color: Colors.black.withOpacity(0.2),
                                      width: 1,
                                  )
                                ),
                              );
                            },
                          )
                        ),*/


/*SingleChildScrollView(
          child: Center(
           child: Padding(
             padding: const EdgeInsets.only(top:40.0,right:25.0,left:25.0,bottom:80.0),
                child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
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
                    padding:const EdgeInsets.all(12.0),
                    child: Column(
                      
                      children:  [
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          alignment: Alignment.topRight,
                          iconSize: 30.0,
                          color: Colors.green[400],
                        ),
                        SizedBox(height: 10.0,),
                        Image(
                            image : AssetImage("assets/icon/img_logo.png"),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.contain,
                        ),
                        SizedBox(height: 20.0),
                        Text("What would you like to do today?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:14
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.0),
                        // buildCard("Learn about feelings"),
                        // buildCard("Learn about helpful strategies"),
                        // buildCard("Work on my thoughts"),
                        // buildCard("Learn some useful tips"),
                        // buildCard("Explore activities to feel beeter"),
                        // buildCard("Relax and calm down"),
                        
                        SizedBox(height: 30.0),
                           SizedBox(height: 30.0,),
                           Container(
                            height: 50.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(40.0),
                              color: Colors.green[400],
                              elevation: 7.0,
                              child: MaterialButton(
                                minWidth: double.infinity,
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(list :favouritesList),));
                                },
                                 child: Text(
                                    'CONTINUE',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15
                                    )
                                  )
                              )
                            ),
                           ),
                      ],
                    ),
                  ),
               ),
            
           ),
         ),
       ),*/

