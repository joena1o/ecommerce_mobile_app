// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

import '../ProductScreen.dart';
import 'Image.dart';


class PopularItems extends StatefulWidget {
  PopularItems({Key? key, required this.products}):super(key: key);

  List products;

  @override
  _PopularItemsState createState() => _PopularItemsState();
}

class _PopularItemsState extends State<PopularItems> {

  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.black, duration: Duration(seconds: 1),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(

      width: size.width,
      height: size.width*0.65,

      child: ListView.builder(

        itemCount: widget.products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i){
          return GestureDetector(
              onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_)=> ProductPage(product: widget.products[i],))
            );
          },
          child:Container(

            width: size.width*0.6,
            margin: EdgeInsets.only(left: 25, top: 20, right: 7, bottom:20),
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),

            child: Stack(
              children: [



                Positioned(
                  top: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(

                        width: size.width*0.6,
                        height: size.width*0.36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                        ),

                        child:  ImageCached(image: widget.products[i]['image'])
                        ),


                      ),
                ),


                Positioned(
                  top: 0,
                  child: Opacity(
                      opacity: 0.5,
                      child:Container(

                        width: size.width*0.6,
                        height: size.width*0.36,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)
                        ),


                      )),
                ),

                Positioned(
                  bottom: 0,
                  child: Container(

                    width: size.width*0.6,
                    height: size.width*0.18,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Color.fromRGBO(250, 250,250, 1)
                        ),
                        ],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.products[i]['item_name']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                        Container(height: 4,),
                        Text("N${widget.products[i]['price']}")
                      ],
                    )

                  ),
                ),

                Positioned(
                    top: size.width*0.30,
                    right: 10,
                    child: GestureDetector(
                      onTap: (){

                    _showMessage("Added to cart");

                      },
                        child:CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.shopping_bag, size: 15),
                    ))
                ),

              ],
            ),
            

          ));
        },

      ),


    );
  }
}
// ignore: file_names
