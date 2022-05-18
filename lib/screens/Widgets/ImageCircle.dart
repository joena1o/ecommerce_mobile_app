import 'package:flutter/material.dart';

class ImageCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1
          )
        ]

      ),
      child: CircleAvatar(
        //borderRadius: BorderRadius.circular(50),
//        child: Image(image: AssetImage("assets/image.jpg"),
//        fit: BoxFit.cover,
//        ),
      backgroundColor: Colors.black,
      child: Text("HB", style: TextStyle(fontSize: 25, color: Colors.white),),
      )

    );
  }
}
