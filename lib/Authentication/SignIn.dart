import 'package:flutter/material.dart';
import 'package:mindmum/OnboardingScreen/OnboardingIntroScreen.dart';
class SignIn extends StatefulWidget {
  @override
   _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  String _email, _pass;
   @override
   Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
          child: Center(
           child: Padding(
             padding: const EdgeInsets.only(top:40.0,right:25.0,left:25.0,bottom:80.0),
             child: Form(
                key: _form,
                child: Container(
                  margin: EdgeInsets.only(top: 50.0),
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
                        SizedBox(height: 30.0,),
                        Image(
                            image : AssetImage("assets/icon/img_logo.png"),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.contain,
                        ),
                        SizedBox(height: 30.0),
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
                           SizedBox(height: 20.0,),
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
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingIntroScreen(),));
                                },
                                 child: Text(
                                    'LOGIN',
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
} 