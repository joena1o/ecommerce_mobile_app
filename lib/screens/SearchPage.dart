import 'package:ecommerce_app/Api/SearchClass.dart';
import 'package:flutter/material.dart';
import 'Widgets/HomeItems.dart';
import 'Widgets/PopularItems.dart';
import 'Widgets/Search.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

   GlobalKey<ScaffoldState> drawerkey =  GlobalKey<ScaffoldState>();

   bool nav = false;

   var price = 20000;

   List results = [];

   SearchClass _searchClass = SearchClass();

   var sizes;


  void openNav(status){


      setState((){

        nav = !nav;

      });


  }


  void fetchSearch (query){

      _searchClass.FetchSearch(query).then((value){

        setState((){

          results = value;

        });




      });

  }



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(

        drawer: Drawer(

          key: drawerkey,

          child: ListView(

            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("Category"),
              )

            ]


          ),

        ),



        body: Container(

            width: size.width,

            height: size.height,

            color: Colors.white,

            child:Stack(

            children: [

              Positioned(
                top: 0,
                child:Container(

                width: size.width,

                height: size.height,

                color: Colors.white,

                child: ListView(

                    children:[

                      GestureDetector(
                          onTap: (){
                            drawerkey.currentState!.openDrawer();
                          },
                          child:SearchBar(nav:openNav,search: fetchSearch)),

                      HomeItems(products: results)

                    ]




                )),



              ),

              Visibility(
                  visible: nav,
                  child:Positioned(
                right: 0,
                child: Container(
                  color: Colors.white,
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: ListView(

                      children: [

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(onPressed: (){
                              openNav(false);
                            },icon:Icon(Icons.close,color: Colors.black,)),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Text("Category"),
                        ),


                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: size.width*0.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)
                            ),
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
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Text("Price"),
                        ),

                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: size.width*0.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)
                            ),
                          child: Column(

                            children: [

                              Slider(
                                onChanged: (double value){
                                  setState(() {
                                    price = value.toInt();
                                  });
                                },
                                value: price.toDouble(),
                                min: 5000,
                                max: 20000,
                                divisions: 5,
                                activeColor: Colors.black,
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Text("N$price"),
                              )

                            ],
                          )
                            ),


                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Text("Sizes"),
                        ),

                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: size.width*0.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)
                            ),
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

                      ]


                  ),
                ),

              )


              )]

           )));
  }
}
