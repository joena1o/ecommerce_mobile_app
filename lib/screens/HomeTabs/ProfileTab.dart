import 'package:flutter/material.dart';
import '../../wrapper.dart';
import '../HomeScreen.dart';
import '../Widgets/ImageCircle.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key? key, required this.auth}) : super(key: key);

  final auth;

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  
  Wrapper Home = Wrapper(auth: false,);
  
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white,

      child: ListView(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[

              Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ImageCircle()
              ),

              Text("Balami Hyefur", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),

            SizedBox(
              height: 30,
            ),


              Text("Jimeta, Adamawa State"),

              SizedBox(
                height: 30,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(250, 250, 250, 1),
                      spreadRadius: 1,
                      blurRadius: 1
                    )
                    ]
                ),
                child: Row(
                  children: [
                    Icon(Icons.shopping_bag),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Orders")
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(250, 250, 250, 1),
                          spreadRadius: 1,
                          blurRadius: 1
                      )
                    ]
                ),
                child: Row(
                  children: [
                    Icon(Icons.notifications),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Push Notification")
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(250, 250, 250, 1),
                          spreadRadius: 1,
                          blurRadius: 1
                      )
                    ]
                ),
                  child: GestureDetector(
                    onTap: (){

                      setState((){
                        widget.auth(false);
                      });


                    },
                    child:Row(
                    children: [
                    Icon(Icons.power_settings_new),
                    SizedBox(
                      width: 20,
                    ),
                      Text("Sign Out")
                  ],
                )),
              ),

              Container(

                padding: EdgeInsets.all(30),
                child: Text("BENUNIQUE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),

              ),
              Container(

                padding: EdgeInsets.only(bottom: 30),
                child: Text("© ${2022}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),

              )


            ]
          ),


        ],
      ),
    );
  }
}
