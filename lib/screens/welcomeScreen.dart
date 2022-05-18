import 'package:flutter/material.dart';
import 'dart:async';

import 'SignUp.dart';


class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key, required this.auth}) : super(key: key);

  final auth;



  Welcome createState() => new Welcome();


}

  class Welcome extends State<WelcomeScreen>{

    bool loading = true;

    bool signUp = false;


  @override
  void initState(){

  super.initState();

   Timer(Duration(seconds: 2), () {


     setState((){

       loading = false;

     });


   });


  }

    void _showMessage(String message) {
      final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.orange,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }



    @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [

  Padding(
  padding: EdgeInsets.all(10),
  child: Text("BEUNIQUE", style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
  ),

  Container(
  height: MediaQuery.of(context).size.height*0.2,
  ),

    (loading)?Container(
  width: 50,
  height: 50,
  child: CircularProgressIndicator(
  backgroundColor: Colors.black,
  strokeWidth: 5,
  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  ),
  ):

  Column(
  children: [
  Padding(
  padding: EdgeInsets.all(10),

  child: FlatButton(
//  color: Colors.red,
  onPressed: (){
    setState((){
      widget.auth(true);
    });
  },
  child: Text("Continue with Google"),
  )
  ),

  Padding(
  padding: EdgeInsets.all(10),
  child: FlatButton(
  onPressed: (){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_)=> SignUp())
    );
  },
  child: Text("Sign Up"),

  )
  )

  ],
  )  ],
  )

  );
  }
  }







