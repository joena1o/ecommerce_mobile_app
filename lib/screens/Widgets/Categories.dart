import 'package:flutter/material.dart';

import '../Category.dart';


class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {


  List items = [
    "Dresses",
    "Skirts",
    "T-shirts",
    "Trousers",
    "Jumpsuit",
    "Shirts",
    "Blouse"
  ];


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height*0.09,
      margin: EdgeInsets.only(left: 15, right: 10, top: 20, bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (Context, i){
          return GestureDetector(
              onTap:(){

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => new Category(cat: items[i].toString())
                  )
                );

              },
              child:Container(
              decoration: BoxDecoration(
              color :Colors.white,
              borderRadius: BorderRadius.circular(20) ,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(250, 250, 250, 1),
                  spreadRadius: 4,
                  blurRadius: 2,
                )
              ]
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  child: Icon(Icons.category, color: Colors.white, size: 10,),
                  backgroundColor: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(items[i], style: TextStyle(letterSpacing: 1),)
              ],
            )
          ));
        },
      )


    );
   }
}
