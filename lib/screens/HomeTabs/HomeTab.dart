import 'package:ecommerce_app/screens/Widgets/Categories.dart';
import 'package:flutter/material.dart';
import '../Widgets/Categories.dart';
import '../Widgets/HomeItemList.dart';
import '../Widgets/PopularItems.dart';
import 'package:ecommerce_app/Api/HomeClas.dart';


class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  HomeClass home = HomeClass();

  List products = [];

  void initState(){

    super.initState();

    home.FetchProducts().then((value){

      setState((){

        products = value;

      });

    });



  }


  @override
  Widget build(BuildContext context) {

    Size size =  MediaQuery.of(context).size;

    return Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: ListView.builder(

          itemCount: products.length+1,
          itemBuilder: (BuildContext ctx, i){


            if(i==0){


              return Column(
                  children: [
                    SizedBox(height: size.height*0.02,),
                    Categories(),
                    SizedBox(height: size.height*0.02,),
                    Container(
                      width: size.width,
                      padding: EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popular Collection", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                          Text("See all", style: TextStyle())
                        ],
                      ),
                    ),

                    PopularItems(products: products,),


                    SizedBox(height: size.height*0.02,),

                    Container(
                      width: size.width,
                      padding: EdgeInsets.all(32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Available", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          Text("", style: TextStyle())
                        ],
                      ),
                    ),



                  ]);



            }else{

              return HomeItemList(product: products[i-1]);

            }


          },



        )


    );
  }
}
