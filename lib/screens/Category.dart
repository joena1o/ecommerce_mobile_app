import 'package:flutter/material.dart';
import 'Widgets/Image.dart';
import "Widgets/Search.dart";
import '../Api/HomeClas.dart';

class Category extends StatefulWidget {
  Category({Key? key, required this.cat}): super(key: key);

  final String cat;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {


  HomeClass home = HomeClass();

  List CatProducts = [];


  void initState(){

    super.initState();

    home.FetchCat(widget.cat).then((value){

      setState((){

        CatProducts = value;

      });



    });




  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(



      body: Container(

      width: size.width,
      height: size.height,
      color: Colors.white,

      child: ListView(

        children: [

          SearchBar(nav:(){}, search: (){},),

          Container(
            height: size.height*0.84,
            width: size.width,
            child: GridView.count(crossAxisCount: 2,
            crossAxisSpacing: 1,
            childAspectRatio: (size.height/2.5 / size.width),
            shrinkWrap: true,
            mainAxisSpacing: 1,
            children: List.generate(CatProducts.length, (i){

              return Container(
                width: size.width,
                height: size.height/3,
                color: Colors.grey,
                child: ImageCached(image: CatProducts[i]['image']),
              );

            }),
            ),

          )


        ],

      ),

    ));
  }
}
