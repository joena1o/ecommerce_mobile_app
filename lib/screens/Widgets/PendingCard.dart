import 'package:flutter/material.dart';

import '../OrderTracking.dart';

class PendingCard extends StatefulWidget {

  PendingCard({Key? key, required this.products}):super(key: key);

  final Object products;

  @override
  _PendingCardState createState() => _PendingCardState();
}

class _PendingCardState extends State<PendingCard> {

  List pending = [];


  void initState(){

    super.initState();

    setState(() {
      pending.add(widget.products);
    });


  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(

      width: size.width,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Container(

                width: size.width*.3,
                  margin: EdgeInsets.only(bottom: 20),
                child: Image(
                  image: AssetImage("assets/delivery.png"),
//                  fit: BoxFit.cover,
                ),

              ),


              Container(

                  width: size.width*.5,


                  child:Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("${pending[0]['items']}"),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("N${pending[0]['price']}"),
                      ),

                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Items : ${pending[0]['volume']}"),
                      ),

//                      Padding(
//                        padding: EdgeInsets.all(10),
//                        child: Text("${pending[0]['time_']}"),
//                      ),
//
//                      Padding(
//                        padding: EdgeInsets.all(10),
//                        child: Text("${pending[0]['date_']}"),
//                      ),

                    ],

                  )),

            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: FlatButton(
              color: Colors.black54,
              onPressed: (){

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx)=> OrderTracking()
                  )
                );

              },
              child: Text("Track Order",style: TextStyle(color: Colors.white),),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: FlatButton(
              color: Colors.black54,
              onPressed: (){

              },
              child: Text("Confirm Delivered",style: TextStyle(color: Colors.white),),
            ),
          )

        ],
      )

    );
  }
}
