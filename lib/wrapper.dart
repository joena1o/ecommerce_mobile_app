import 'package:flutter/material.dart';
import 'screens/welcomeScreen.dart';
import 'screens/HomeScreen.dart';

class Wrapper extends StatefulWidget {

   Wrapper({Key? key, required this.auth}) : super(key: key);

   bool auth;

  @override
  _WrapperState createState() => _WrapperState();

}

class _WrapperState extends State<Wrapper> {


  setAuth(val){

    setState((){

      widget.auth = val;

    });

    print("Working");

  }


  @override
  Widget build(BuildContext context) {
    return (widget.auth)?HomeScreen(auth: setAuth):WelcomeScreen(auth: setAuth);
  }
}
