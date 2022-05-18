import 'package:flutter/material.dart';
import 'Image.dart';

class CartsItems extends StatefulWidget {

  CartsItems({Key? key, required this.item, required this.cb}): super(key: key);

  Object item;
  Function cb;


  @override
  _HomeItemsState createState() => _HomeItemsState();
}

class _HomeItemsState extends State<CartsItems> {


  List Item = [];

  void initState(){

    super.initState();


    Item.add(widget.item);

  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

//    int price = (int.parse(Item[0]['price'])*int.parse(Item[0]['quantity_c']));
//
//    print(price);

    return Container(
        width: size.width,
//        height: size.height*.2,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:Container(
                    width: size.width*0.25,
                    height: size.width*0.25,
                    child: ImageCached(
                      image: Item[0]['image']
                    )

                )
            ),

            Container(
                width: size.width*0.53,
                padding: EdgeInsets.symmetric(vertical: 10),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                        padding: EdgeInsets.all(5),
                        child:Text("${Item[0]['item_name']}", style: TextStyle(fontWeight: FontWeight.bold),)),

                    Padding(
                        padding: EdgeInsets.all(5),
                        child:Text("N${Item[0]['price']}", style: TextStyle(fontWeight: FontWeight.normal),)),

                    Padding(
                        padding: EdgeInsets.all(5),
                        child:Text("Quantity: ${Item[0]['quantity_c']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color:Colors.grey),)),


                  ],

                )),

            Container(

                width: size.width*.03,
                padding: EdgeInsets.only(right: 10),
//                child: Center(child:IconButton(
//              onPressed: (){
//               setState((){
//                 widget.cb;
//               });
//              },
//              icon: Icon(Icons.delete, size: 20, color: Colors.grey,),
//            ))
            )


          ],
        )

    );
  }
}
