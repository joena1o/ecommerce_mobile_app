import 'package:flutter/material.dart';


class SearchBar extends StatefulWidget {

  SearchBar({Key? key, required this.nav, required this.search}): super(key: key);

   var nav;

   var search;




  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {


  TextEditingController searchText = TextEditingController();



  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;

    return Container(

      width: size.width,
      height: size.height*0.1,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(250,250,250,1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceAround,

        crossAxisAlignment: CrossAxisAlignment.stretch,

        children:[

           GestureDetector(
               onTap: (){
                 Navigator.of(context).pop();
               },
               child:CircleAvatar(
             backgroundColor: Color.fromRGBO(250,250,250,1),
             child: Icon(Icons.keyboard_backspace, color: Colors.black,),
           )),


        Center(child: Container(

            width: size.width*0.6,


              child:TextField(
                controller: searchText,
              onChanged: (value){

                  if(value.isEmpty) return;
                  widget.search(value.toString());

              },
              decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search here....",
              hintStyle: TextStyle(fontSize: 15),

            ),


          ))),

           IconButton(



               onPressed: (){



                 widget.nav(true);
               } ,
               icon:Icon(
              Icons.tune
            ))



        ]


      ),

    );
  }
}
