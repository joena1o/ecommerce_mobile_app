import 'dart:async';

import 'package:ecommerce_app/Api/CartClass.dart';
import 'package:flutter/material.dart';

import 'Widgets/Image.dart';

class CheckOut extends StatefulWidget {
  CheckOut({Key? key, required this.order, required this.cab}):super(key: key);

   List order = [];

    Function cab;

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  CartClass checkout = CartClass();

  var total = 0.00;
  var items = "";
  num volume = 0;


   checkOutOrder(){

     showDialog(
         context: context,
         builder: (_){
           return Center(child:CircularProgressIndicator(color: Colors.red,));
         }
     );

     checkout.CheckOut(items, total, volume, "hyef", "08149056513", "Kofare", "Adamawa", "Paid")
     .then((value){

        if(value == "done"){

          widget.cab;




          Timer(Duration(
            seconds: 2
          ),(){

            _showMessage("Order place successfully");

            Navigator.of(context).pop();

            Navigator.of(context).pop();


          });




        }else{



        }

     });


   }


      ProcessOrder(List data){


        for(var i=0; i<data.length; i++){



          setState(() {

            total += (data[i]['price']*data[i]['quantity_c']);



          });




        }

        for(var i=0; i<data.length; i++){



          setState(() {

            items += "${data[i]['item_name']} (${data[i]['quantity_c']}) ";



          });




        }

        for(var i=0; i<data.length; i++){



          setState(() {

            volume += data[i]['quantity_c'];



          });




        }







      }

  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.black,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

      void initState(){

        super.initState();

        ProcessOrder(widget.order);

      }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(

        title: Text("Checkout", style: TextStyle(color: Colors.black, fontSize: 16),),

        elevation: 0,

        backgroundColor: Colors.white,

        leadingWidth: 0,

        toolbarHeight: size.height*.1,



        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: (){
//                Navigator.of(context).pop();
              },
              icon: Icon(Icons.edit, color: Colors.black,),
            ),
          )
        ],

      ),

      body: Container(

        padding: EdgeInsets.all(10),

        width: size.width,

        height: size.height,

        child: ListView.builder(
            itemCount: widget.order.length+1,
            itemBuilder: (BuildContext ctx, i){

              if(i==0) {
                return Container(

                      width: size.width,

                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Customer Name",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Hyefur Jonathan Balami"),
                          ),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("State",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Adamawa State"),
                          ),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Address",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("NO. 76 Oxford Road, Kofare Layout"),
                          )
                        ],
                      ),

                    ),

                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("ITEMS",
                        style: TextStyle(fontWeight: FontWeight.normal),),
                    ),


                  ],
                ));
              }else{

                return Container(

                  width: size.height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: size.width*.3,
                        height: size.width*.35,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:ImageCached(
                          image: widget.order[i-1]['image']
                        )),


                      ),

                      Container(
                        width: size.width*.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [


                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text("${widget.order[i-1]['item_name']}"),
                            ),

                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text("N${widget.order[i-1]['price']}"),
                            ),

                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text("Quantity: ${widget.order[i-1]['quantity_c']}"),
                            )

                          ],


                        ),
                      )

                    ],
                  ),


                );

              }

        })

      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: size.height*.1,
            width: size.width,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Total: N${total}"),

            RaisedButton(
              onPressed: (){
                  checkOutOrder();
              },
              color: Colors.red,
              child: Text("Pay Now",style: TextStyle(color: Colors.white),),
            )

          ],
        )),
      ),

    );
  }
}
