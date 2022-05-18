import 'package:ecommerce_app/Api/CartClass.dart';
import 'package:flutter/material.dart';
import 'CheckOutScreen.dart';
import "Widgets/CartsItems.dart";
import 'Widgets/PendingCard.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin{


  CartClass _cartClass = CartClass();

  List CartItems = [];

  List Pending = [];

  var id;

  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.black, duration: Duration(seconds: 1),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  getCartItems(){

    _cartClass.FetchCart("hyef").then((value){

        setState((){

          CartItems = value;

        });


      });

  }

  clearCart(){

    print("Clearing");

    setState((){

      CartItems.clear();

    });

  }

  getOrders(){

    _cartClass.FetchOrders("hyef").then((value){


      setState((){

        Pending= value;

      });


    });

  }

  DeleteItem(){


    showDialog(
        context: context,
        builder: (_){
          return Center(child:CircularProgressIndicator(color: Colors.red,));
        }
    );

  }


  CartItem(id, i){

    _cartClass.removeFromCart(id).then((value){


      Navigator.of(context).pop();

//      if(value=="done"){

      setState((){

        CartItems.removeAt(i);

      });



//      }else{
//
//
//
//      }

    });



  }

  void initState(){

    super.initState();


    getCartItems();
    getOrders();


  }

  


  @override
  Widget build(BuildContext context) {




    Size size = MediaQuery.of(context).size;

    return DefaultTabController(length: 3, child:Scaffold(
      appBar: AppBar(
        title: Text("", style:TextStyle(color:Colors.black)),
        backgroundColor: Colors.white,
        toolbarHeight: size.width*0.16,
        elevation: 0,
        leading:  IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon:Icon(Icons.keyboard_backspace, color: Colors.black,)
        )
        ,
        bottom: TabBar(
//          controller: _tabController,
        labelColor: Colors.black,
          indicatorColor: Colors.black,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
          tabs: [
            Tab(text: "Cart",),
            Tab(text: "Pending",),
            Tab(text: "Delivered",),
          ],
        ),

      ),
      body: TabBarView(
        children: [

          Container(

            width: size.width,
            height: size.height,
            child: ListView.builder(
                itemCount: CartItems.length,
                itemBuilder: (BuildContext ctx, i){

                  return GestureDetector(
                    onTap:(){


                      setState(() {

                        id = CartItems[i]['ind'];


                      });

                      print(id);


                      showModalBottomSheet(context: context, builder: (_){
                        return Container(
                          height: size.height*.3,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(Icons.edit),
                                      backgroundColor: Colors.black,
                                    ),
                                    Container(width: 20,),
                                    Text("Edit")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.black,
                                      child: IconButton(
                                        onPressed: (){

                                          Navigator.of(context).pop();

                                          showDialog(
                                              context: context,
                                              builder: (_){
                                                return Center(child:CircularProgressIndicator(color: Colors.red,));
                                              }
                                          );

                                          CartItem(id, i);



                                        },
                                        icon:Icon(Icons.delete),

                                    )),
                                    Container(width: 20,),
                                      Text("Remove")
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }, );

                    },
                      child:CartsItems(item: CartItems[i], cb: DeleteItem,)
                  );

                }
            ),

          ),

          Container(

            width: size.width,
            height: size.height,
            child: ListView.builder(
                itemCount: Pending.length,
                itemBuilder: (BuildContext ctx, i){

                  return PendingCard(products: Pending[i],);

                }
            ),

          ),

          Container(

            width: size.width,
            height: size.height,
            child: ListView.builder(
                itemCount: 0,
                itemBuilder: (BuildContext ctx, i){

                  return CartsItems(item: {}, cb: DeleteItem);

                }
            ),

          ),

        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child:RaisedButton(
                  onPressed: (){

                    if(CartItems.length < 1){
                      
                      _showMessage("Cart is Empty");
                      
                    }else{
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => CheckOut(order: CartItems,cab:clearCart))
                      );
                    }
                    
                  },
                  color: Colors.red,
                  child: Text("Check Out", style: TextStyle(color:Colors.white),),
                ))
          ],
        ),
      ),

    ));
  }
}
