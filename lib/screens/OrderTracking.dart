import 'package:flutter/material.dart';


class OrderTracking extends StatefulWidget {
  @override
  _OrderTrackingState createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Order", style: TextStyle(color: Colors.black, fontSize: 15),),
        backgroundColor:Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.keyboard_backspace, color: Colors.black,),
        ),

      ),
      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(20),
            child: Text("item name"),
          )

        ],
      ),
    );
  }
}