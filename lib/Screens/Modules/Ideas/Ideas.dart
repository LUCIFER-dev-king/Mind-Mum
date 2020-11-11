import 'package:flutter/material.dart';
import 'Understanding.dart';
class Ideas extends StatefulWidget {
  @override
   _IdeasState createState() => _IdeasState();
}
class _IdeasState extends State<Ideas> {

   cards(iconCode, iconTitle){
     return Card(
       child: InkWell(
         child : Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
              Icon(
                IconData(iconCode),
                size: 85.0,
              ),
              SizedBox(height: 10.0,),
              Text(iconTitle,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold    
              ),
              textAlign: TextAlign.center,
            )
           ],
         ),
         onTap: (){
           switch(iconTitle){
             case "Understanding":
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Understanding(),));
           }
         },
       ),
     );
   }

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("IDEAS"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          cards(57744, "Understanding"),
          cards(57744, "HELPFUL STRATEGIES"),
          cards(57744, "WHAT I NEED"),
          cards(57744, "WORK ON THOUGHTS"),
          cards(57744, "CONNECT WITH OTHERS"),
          cards(57744, "STEPS TO WELL BEING"),
        ],
      )
    );
  }
  
} 





/*Container(
          padding: EdgeInsets.all(10),
           child: Column(
             children: [
               Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     FittedBox(
                          child: Container(
                            height: 160.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white,
                              boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                            ),
                            child: Column(
                              children: <Widget>[
                                IconButton(icon: Icon(Icons.access_alarm), onPressed: (){
                                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Understading(),));
                                }),
                                SizedBox(height: 50,),
                                Text("UNDERSTANDING",style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ],
                        ),
                      )
                    ),
                    FittedBox(
                          child: Container(
                            height: 160.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white,
                              boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                            ),
                            child: Column(
                              children: <Widget>[
                                IconButton(icon: Icon(Icons.access_alarm), onPressed: null),
                                SizedBox(height: 50,),
                                Text("HELPFUL STRATEGIES",style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ],
                        ),
                      )
                    ),
                   ],
                 ),
                 SizedBox(height : 10),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     FittedBox(
                          child: Container(
                            height: 160.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white,
                              boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                            ),
                            child: Column(
                              children: <Widget>[
                                IconButton(icon: Icon(Icons.access_alarm), onPressed: null),
                                SizedBox(height: 50,),
                                Text("WHAT I NEED",style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ],
                        ),
                      )
                    ),
                    FittedBox(
                          child: Container(
                            height: 160.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white,
                              boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                            ),
                            child: Column(
                              children: <Widget>[
                                IconButton(icon: Icon(Icons.access_alarm), onPressed: null),
                                SizedBox(height: 50,),
                                Text("WORK ON THOUGHTS",style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ],
                        ),
                      )
                    ),
                   ],
                 ),
                 SizedBox(height : 10 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     FittedBox(
                          child: Container(
                            height: 160.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white,
                              boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                            ),
                            child: Column(
                              children: <Widget>[
                                IconButton(icon: Icon(Icons.access_alarm), onPressed: null),
                                SizedBox(height: 50,),

                                Text("CONNECT WITH OTHERS",style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ],
                        ),
                      )
                    ),
                    FittedBox(
                          child: Container(
                            height: 160.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white,
                              boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                            ),
                            child: Column(
                              children: <Widget>[
                                IconButton(icon: Icon(Icons.access_alarm), onPressed: null),
                                SizedBox(height: 50,),
                                Text("STEPS TO WELL BEING",style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ],
                        ),
                      )
                    ),
                   ],
                 ),
             ],
           ),
      ), */