// ignore: file_names
// ignore: file_names
// ignore: file_names
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'HomeTabs/FavTab.dart';
import 'HomeTabs/ProfileTab.dart';
import 'SearchPage.dart';
import "CartScreen.dart";
import 'HomeTabs/HomeTab.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key? key, required this.auth}) : super(key: key);

  final auth;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var Tab = 0;


  void changeTab(index){

    setState((){

      Tab = index;

    });


  }

  @override
  Widget build(BuildContext context) {

    var Tabs = [HomeTab(),FavTab(),ProfileTab(auth: widget.auth)];

    Size size = MediaQuery.of(context).size;

    return
      WillPopScope(
        onWillPop:()async{

              if(Tab!=0)
                changeTab(0);
              else {
                SystemNavigator.pop();
              }

              return false;


          },

        child:

        Scaffold(

          appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("BEUNIQUE", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),),
          elevation: 0,
          toolbarHeight: size.width*0.18,
          titleSpacing: 28,
          actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.black12,
              child: IconButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext ctx)=> SearchPage()
                      )
                    );
                  },
                  icon: Icon(Icons.search, color: Colors.black,)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(child:Stack(children:[CircleAvatar(
              radius: 24,
              backgroundColor: Colors.black12,
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                    builder: (_) => CartPage()
                  ));
                },
                icon: Icon(Icons.shopping_bag, color: Colors.black,)),
            ),

              Positioned(
                  right: 0,
                  child:
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 8,
                child: Text("1", style: TextStyle(color:Colors.white, fontSize: 10),),
              ))

            ],
          )))
        ],
      ),

      body: (Tab==0)?Tabs[0]:((Tab==1?Tabs[1]:Tabs[2])),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, size: (Tab==0)?18:24),
              onPressed: (){

                changeTab(0);

              },
            ),

            IconButton(
              icon: Icon(Icons.favorite_outline, size: (Tab==1)?18:24,),
              onPressed: (){

                changeTab(1);

              },
            ),

            IconButton(
              icon: Icon(Icons.person_outline, size: (Tab==2)?18:24),
              onPressed: (){

                changeTab(2);

              },
            )


          ],
        ),
      ),

    ));
  // ignore: file_names
  }
}
