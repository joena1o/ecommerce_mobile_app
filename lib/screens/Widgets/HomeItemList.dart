import "package:flutter/material.dart";
import 'package:ecommerce_app/screens/Widgets/Image.dart';
import '../ProductScreen.dart';

class HomeItemList extends StatefulWidget {
  HomeItemList({Key? key, required this.product}): super(key: key);

  Object product;

  @override
  _HomeItemListState createState() => _HomeItemListState();
}

class _HomeItemListState extends State<HomeItemList> {

  List products = [];

  void initState(){

    super.initState();

    products.add(widget.product);

  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_)=> ProductPage(product: products[0],))
        );
      },
        child:Container(
      width: size.width,
      height: size.height*.2,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:Container(
              width: size.width*0.25,
              height: size.width*0.25,
              child: ImageCached(image: products[0]['image'])

            )
          ),

          Container(
              width: size.width*0.60,
              padding: EdgeInsets.symmetric(vertical: 10),
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              Padding(
                  padding: EdgeInsets.all(5),
                  child:Text("${products[0]['item_name']}", style: TextStyle(fontWeight: FontWeight.bold),)),

              Padding(
                  padding: EdgeInsets.all(5),
                  child:Text("N${products[0]['price']}", style: TextStyle(fontWeight: FontWeight.normal),)),

              Padding(
                  padding: EdgeInsets.all(5),
                  child:Text("Women", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color:Colors.grey),)),


            ],

          ))


        ],
      )

    ));
  }
}
