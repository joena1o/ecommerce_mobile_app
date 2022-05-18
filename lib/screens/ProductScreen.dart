import 'dart:async';

import 'package:ecommerce_app/Api/ProductClass.dart';
import 'package:ecommerce_app/util/util.dart';
import 'package:flutter/material.dart';

import 'Widgets/Image.dart';

class ProductPage extends StatefulWidget {

  ProductPage({Key? key, required this.product}):super(key: key);

  Object product;


  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  List Item = [];

  var quantity = 1;

  var sizes;

  ProductClass _productClass = ProductClass();

  bool addToFav = false;

  TextEditingController review_text = TextEditingController();

  var rating = 3.0;

  bool order = false;

  bool review = false;

  void initState(){

    super.initState();

    Item.add(widget.product);


  }

  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.black, duration: Duration(seconds: 1),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return WillPopScope(onWillPop: () async{

      if(order){

        setState((){

          order = false;


        });

      }else if(review){

        setState((){

          review = false;


        });

      }else{

        Navigator.of(context).pop();

      }
      return false;

    }, child:Scaffold(

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){

          return <Widget>[

            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height*0.3,
              floating: true,
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.white,
              leading: Container(
                   margin: EdgeInsets.only(left: 20),
                  child: IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon:Icon(Icons.keyboard_backspace, size: 24, color: Colors.grey,))),
              actions: [
                Container(
                    margin: EdgeInsets.only(right: 20),
                    child:IconButton(
                  onPressed: (){
                    _productClass.addToFav(Item[0]['id'].toString(),username).then((value){

                      if(value == "done"){

                        _showMessage("Added to Favourites");

                        setState((){

                          addToFav = true;

                        });

                      }else{

                        _showMessage("Removed from Favourites");

                        setState((){

                          addToFav = false;

                        });

                      }



                    });
                  },
                  icon: Icon((!addToFav)?Icons.favorite_border:Icons.favorite, color:Colors.grey),
                ))
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,

                background: Container(
                    color: Colors.black,
                    child:Opacity(
                        opacity: 0.4,
                        child:ImageCached(image:Item[0]['image']))),


              ),
            ),


          ];


        }, body: Stack(

            children: [

              Positioned(
                top:0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: size.height,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [

                      Container(

                          margin: EdgeInsets.symmetric(vertical:15, horizontal: 10),


                          child:Text("Women", style: TextStyle(fontSize: 13, color: Colors.black))),

                      Container(
                          padding: EdgeInsets.symmetric(vertical:15, horizontal: 10),
                          child:Text("${Item[0]['item_name']}", style: TextStyle(fontSize: 20))),



                      Padding(
                          padding: EdgeInsets.all(10),
                          child:Text(("Price").toUpperCase(), style: TextStyle(fontSize: 13))),

                      Padding(
                          padding: EdgeInsets.all(10),
                          child:Text("N${Item[0]['price']}", style: TextStyle(fontSize: 15,color: Colors.grey))),

                      Padding(
                          padding: EdgeInsets.all(10),
                          child:Text(("Description").toUpperCase(), style: TextStyle(fontSize: 13))),

                      Padding(
                          padding: EdgeInsets.all(10),
                          child:Text("${Item[0]['descrip']}",
                              style: TextStyle(fontSize: 15, color: Colors.grey))),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child:Text(("Sizes").toUpperCase(), style: TextStyle(fontSize: 13))),

                      Padding(
                          padding: EdgeInsets.all(10),
                          child:Text("${Item[0]['sizes']}", style: TextStyle(fontSize: 15, color: Colors.grey))),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Divider(color: Colors.grey,),
                      ),

                      Padding(
                          padding: EdgeInsets.only(top:10),
                          child:Center(
                            child: Text("Reviews", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          )),

                      Padding(
                          padding: EdgeInsets.only(top:30),
                          child:Center(
                              child: FlatButton(
                                color: Colors.black,
                                onPressed: (){

                                  setState((){

                                    review = !review;

                                  });

                                },
                                child:Text("Submit review", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color:Colors.white),),
                              )
                          ))

                    ],
                  ),
                ),
              ),

              Visibility(
                  visible: order,
                  child:Positioned(
                      bottom: 0,
                      child: Opacity(
                        opacity: 0.5,
                        child: GestureDetector(
                            onTap: (){
                              setState((){
                                order = !order;

                              });
                            },
                            child:Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                          ),
                          width: size.width,
                          height: size.height,

                        )),
                      ))),

              Visibility(
                  visible: review,
                  child:Positioned(
                      bottom: 0,
                      child: Opacity(
                        opacity: 0.5,
                        child: GestureDetector(
                            onTap: (){
                              setState((){


                                if(review)
                                review = false;
                              });
                            },
                            child:Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                              width: size.width,
                              height: size.height,

                            )),
                      ))),

              Visibility(
                  visible: order,
                  child:Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,

                  ),
                  width: size.width,
                  height: size.height*0.47,
                  child: SingleChildScrollView(
//                    children: [
//                      addsheet(context)
//                    ],
                  child: addsheet(context),
                  ),
                ),
              )),

              Visibility(
                  visible: review,
                  child:Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,

                      ),
                      width: size.width,
                      height: size.height*0.52,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text("New Review"),
                            ),

                            Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.all(20),
                              child: TextFormField(
                                controller: review_text,
                                maxLines: 2,
                                decoration: InputDecoration(
                                  hintText: "Review",
                                  border: InputBorder.none
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Slider(
                                onChanged: (double value){
                                  setState(() {
                                    rating = value.toDouble();
                                  });
                                },
                                value: rating.toDouble(),
                                min: 0,
                                max: 5,
                                divisions: 5,
                                activeColor: Colors.black,
                              ),
                            ),

                            Container(
                              child: Text("Rating: ${rating}")
                              ,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),



            ],

          ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: (review)?Container(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
          child: FlatButton(
            color: Colors.black,
            onPressed: (){

              showDialog(
                  context: context,
                  builder: (_){
                    return Center(child:CircularProgressIndicator(color: Colors.red,));
                  }
              );

              _productClass.postReview("hyef", review_text.text.toString(), rating, Item[0]['id'].toString()).then((value){
                if(value=="sent"){
                  Timer(Duration(
                      seconds: 1
                    ),(){
                    Navigator.of(context).pop();
                    _showMessage("Review Sent");
                  }
                  );

                }
              });

            },
            child: Text("Submit", style: TextStyle(color:Colors.white)),
          ),
        ):((order)?Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(

              child: IconButton(
                onPressed: (){

                  try{
                  _productClass.addCart(Item[0]['id'],quantity, username);
                }catch(e){
                    print(e.toString());
                  }

                },
                icon: Icon(Icons.shopping_bag),
              ),

            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: MediaQuery.of(context).size.width*0.8,
                child:GestureDetector(
                    onTap: (){

//                      setState((){
//
//                        order = !order;
//
//                      });

                    },

                    child: GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (_){
                            return Center(child:CircularProgressIndicator(color: Colors.red,));
                          }
                        );
                      },
                      child:Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)

                      ),

                      padding: EdgeInsets.all(10),

                      child: Text("Order Only", textAlign: TextAlign.center, style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),),
                  ))
                  ))],
        ):Container(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
          child: FlatButton(
            color: Colors.red,
            onPressed: (){

              setState((){

                order = true;

              });

            },
            child: Text("Order Now", style: TextStyle(color:Colors.white)),
          ),
        )
      ),

    )));
  }

  addsheet(context){

    Size size = MediaQuery.of(context).size;

    return Container(

      width: size.width,
      height: size.height*0.8,
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                width: size.width*0.3,
                height: 100,
                child: ImageCached(image: Item[0]['image']),
              ),

              Column(
                children: [

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: size.width*0.5,
                    child: Text(Item[0]['item_name'], style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: size.width*0.5,
                    child: Text(Item[0]['descrip']),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: size.width*0.5,
                    child: Text(Item[0]['category']),
                  ),

                  Container(

                      width: size.width*0.5,
                      child: DropdownButton(
                        hint: Text("Select Size",style: TextStyle(fontSize: 14),),
                        isExpanded: true,
                        underline: Container(),
                        value: sizes,
                        onChanged: (newvalue) {
                          setState((){

                            sizes = newvalue;

                            print(sizes);


                          });

                        },
                        items:[

                          DropdownMenuItem(
                              child: Text("Large"),
                              value: "L"

                          ),
                          DropdownMenuItem(
                              child: Text("Medium"),
                              value: "M"

                          ),
                          DropdownMenuItem(
                              child: Text("Small"),
                              value: "S"

                          ),



                        ],
                      )),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: size.width*0.5,
                    child: Row(
                      children: [
                    GestureDetector(
                    onTap: (){
                    setState((){


                    if(quantity > 1)
                      quantity--;

                    });
                    },
                    child:
                        CircleAvatar(
                          child: Icon(Icons.exposure_minus_1, size: 16,),
                          radius: 15,
                          backgroundColor: Colors.black,
                        )),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child:Text("$quantity")),
                        GestureDetector(
                            onTap: (){
                              setState((){


                                quantity++;

                              });
                            },
                            child:CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(Icons.add, size: 16,),
                          radius: 15,
                        )),

                      ],
                    ),
                  )

                ],
              ),




            ],

          ),


//          Container(
//            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
//            width: size.width*0.5,
//            child: FlatButton(
//              color: Colors.red,
//                onPressed: (){
//
//                },
//                child:Text("Order Now", style: TextStyle(color:Colors.white),)),
//          ),



        ],
      ),

    );

  }

}
