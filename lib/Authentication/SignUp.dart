import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {
  @override
   _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  String _email, _pass, _name, _postCode;
 

  List<String>_iAm = ['Pregnant','A new mother','Browing', 'A health professional',];
  var _iAmCurrentItem='Pregnant';

  List<String> _iHereThrough = ['MumSpace Website','Google Search','App store search', 'My GP', 'A health professional', 'Others'];
  var _iHereThroughItem='MumSpace Website';

  List<String> _iAmFrom = ['ACT','NSW','NSW','QLD', 'NT', 'VIC', 'WA', 'SA', 'TAS', 'Overseas'];
  var _iAmFromItem='ACT';

  List <String> _age = ["15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60",];
  var _ageItem='22';
  var _date="";

  bool isMom = false;
  bool isPregnant = false;
  
  var _ageCurrentItem = [];

  DateTime currentTime = DateTime.now();
  
  bool checkValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkValue= false;
  }
   @override
   Widget build(BuildContext context) {
    var checkedValue;
    return Scaffold(
       body : SingleChildScrollView(
          child: Center(
           child: Padding(
             padding: const EdgeInsets.only(top:40.0,right:25.0,left:25.0,bottom:80.0),
             child: Form(
                key: _form,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget> [
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
                        
                        Container(
                           padding: EdgeInsets.only(top:20.0),
                           child: TextFormField(
                               validator: (input){
                                 if(input.isEmpty)
                                 {
                                   return "Provide an Name";
                                 }
                               },
                               onSaved: (input) => _name = input,
                              decoration: InputDecoration(
                                 labelText: 'Name',
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(5.0),
                                  
                                 )
                               ),
                             ),
                        ),
                       
                        

                        //  buildDropDownContainer(_iHereThrough,_iHereThroughItem,"I am here through"),

                        //  buildDropDownContainer(_iAmFrom,_iAmFromItem,"I am from"),

                        //  buildDropDownContainer(_age,_ageItem,"Age"),

                         buildDropDownContainer(_iAm,_iAmCurrentItem,"I Am"),

                            buildBirthDateForMom(),

                            buildBirthDateForPregnant(),

                            Container(
                             padding: EdgeInsets.only(top:20.0),
                             child: TextFormField(
                               
                               decoration: InputDecoration(
                                 labelText: 'Post Code',
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(5.0),
                                  
                                 )
                               ),
                               onSaved: (input) => _postCode = input,
                             ),
                           ),
                        
                        buildTextContainer("Create an account"),
                        Container(
                             padding: EdgeInsets.only(top:20.0),
                             child: TextFormField(
                               validator: (input){
                                 if(input.isEmpty)
                                 {
                                   return "Provide an email";
                                 }
                               },
                               decoration: InputDecoration(
                                 labelText: 'Email',
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(5.0),
                                  
                                 )
                               ),
                               onSaved: (input) => _email = input,
                             ),
                           ),
                            Container(
                             padding: EdgeInsets.only(top:20.0),
                             child: TextFormField(
                               validator: (input){
                                 if(input.length < 6)
                                 {
                                   return "6 character is must";
                                 }
                               },
                               decoration: InputDecoration(
                                 labelText: 'Password',
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(10.0),
                                  
                                 )
                               ),
                               onSaved: (input) => _pass = input,
                               obscureText: true,
                             ),
                           ),
                           
                           SizedBox(height: 30.0,),
                           Container(
                            height: 50.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(40.0),
                              color: Colors.green[400],
                              elevation: 7.0,
                              child: MaterialButton(
                                minWidth: double.infinity,
                                onPressed: (){},
                                 child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15
                                    )
                                  )
                              )
                            ),
                           ),
                           SizedBox(height: 30.0,),
                           Container(
                             padding: EdgeInsets.only(top:20.0),
                             child: GestureDetector(
                               child: Text("Terms and Conditions",
                                  style: TextStyle(
                                    color: Colors.green[400],
                                    fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                               ),
                               onTap: (){},
                             ),
                           )
                      ],
                    ),
                  ),
               ),
             ),
           ),
         ),
       ),
    );
  }

   Container buildDropDownContainer(List<String> listName,String listItem,String dropdownName) {
     return Container(
                        color: null,
                        padding: EdgeInsets.only(top:20.0),
                         child: Container(
                          width: double.infinity,
                          height: 60,
                          child: InputDecorator(
                            decoration: InputDecoration(
                                labelText: dropdownName,  
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                             child: DropdownButton<String> (
                               dropdownColor: null,
                                 items: listName.map((String dropDownStringItem){
                                   return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                   );
                                 }).toList(),
                                 onChanged: (String newValue){
                                   setState(() {
                                     this._iAmCurrentItem = newValue;
                                     if(newValue==_iAmCurrentItem){
                                       this._iAmCurrentItem = newValue;
                                     if(_iAmCurrentItem=='A new mother'){
                                       isMom = true;
                                     }else{
                                       isMom=false;
                                       _date = "";
                                     }
                                     if(_iAmCurrentItem=='Pregnant'){
                                       isPregnant = true;
                                     }
                                     else{
                                       _date = "";
                                       isPregnant=false;
                                     }
                                     }

                                    //  if(listItem == _iHereThroughItem){

                                    //  }
                                     
                                   });
                                 },
                                 hint: Text('Select a Mode'),
                                 value: _iAmCurrentItem,
                                 elevation: 24,
                                 isExpanded: true,
                                 itemHeight: 55,
                                ),
                          ),
                            ),
                      );
   }

   Container buildTextContainer(String text) {
     return Container(
               padding: EdgeInsets.only(top:20.0),
               margin: EdgeInsets.only(left:2.0),
               child: Text(
               text,
               style : TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 14
            )
         ),
      );
   }

   buildBirthDateForPregnant() {
    return isPregnant?Container(
      child:GestureDetector(
        onTap: ()=>showDatePicterDialog(context),
        child: Container(
          padding: EdgeInsets.only(top:10.0),
          child:Container(
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Baby\'s due date',  
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              child: Text(_date),
            ),
          )
        ),
      ),
    ):SizedBox(height: 1.0,);
  }

  buildBirthDateForMom() {
    return isMom?Container(
      child: GestureDetector(
        onTap: ()=>showDatePicterDialog(context),
        child: Container(
          margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
          child:Container(
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Baby\'s birth date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(_date),
            ),
          )
        ),
      ),
    ):SizedBox(height: 1.0,);
  }

  showDatePicterDialog(BuildContext context) async {
  final DateTime picked = await showDatePicker(
    context: context,
    initialDate: currentTime,
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
  );
  if (picked != null && picked != currentTime)
    setState(() {
      currentTime = picked;
      _date = "${currentTime.day}-${currentTime.month}-${currentTime.year}";
    });
}
} 



/*Container(
                          margin: EdgeInsets.only(right : 200.0),
                          child: CheckboxListTile(
                            title: Text("list"),
                            value: checkValue,
                            onChanged: (newValue){
                              setState(() {
                                checkValue = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            checkColor: Colors.green[400],
                          ),
                        ),*/