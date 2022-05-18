import 'package:ecommerce_app/Api/FavClass.dart';
import 'package:ecommerce_app/screens/Widgets/HomeItemList.dart';
import 'package:ecommerce_app/screens/Widgets/HomeItems.dart';
import 'package:flutter/material.dart';


class FavTab extends StatefulWidget {
  @override
  _FavTabState createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {


  FavClass _favClass = FavClass();

  List Fav = [];


  void initState(){

    super.initState();

    _favClass.FetchFav().then((value){

        setState((){

          Fav = value;

        });


    });



  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(

      width: size.width,
      height: size.height,

      child: ListView.builder(
        itemCount: Fav.length+1,
        itemBuilder: (BuildContext ctx, i){


          return (i==0)?
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text("WishList", style:TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
              )
              :HomeItemList(product: Fav[i-1],);
        },
      )


//

    );
  }
}
