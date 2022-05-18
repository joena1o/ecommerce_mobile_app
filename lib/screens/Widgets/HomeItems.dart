import 'package:flutter/material.dart';

import '../ProductScreen.dart';
import 'Image.dart';


class HomeItems extends StatefulWidget {

  HomeItems({Key? key, required this.products}): super(key:key);

  final List products;


  @override
  _HomeItemsState createState() => _HomeItemsState();
}

class _HomeItemsState extends State<HomeItems> {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(

      width: size.width,
      height: size.height*0.84,
      padding: EdgeInsets.all(10),

      child: GridView.count(crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 3,
        childAspectRatio: (size.height*0.45 / size.width),
        shrinkWrap: true,
        controller: ScrollController(keepScrollOffset: false),
        children: List.generate(widget.products.length, (i){
        return Container(

          width: 400,
          height: size.height/2,

          child: GestureDetector(

          onTap: (){

            Navigator.of(context).push(

              MaterialPageRoute(builder: (_)=> ProductPage(product: widget.products[i]) )

            );

          },

          child:Stack(

            children: [

              Positioned(
                  top:0,
                  child:
                  Container(
                      height: size.height*0.24,
                      width: size.width/2,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                      ),
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                      child: ImageCached(
                        image: widget.products[i]['image']
                      )
                    )

              ),
            ),


              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: size.height*0.15,
                  width: size.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("${widget.products[i]['item_name']}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),),
                      Text("Price: ${widget.products[i]['price']}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5,),
                      Text("${widget.products[i]['category']}", style: TextStyle(color:Colors.grey, fontWeight: FontWeight.bold)),

                    ],
                  )
                ,
                )
              ),



            ],
          )

        ));
      }),)


    );
  }
}
