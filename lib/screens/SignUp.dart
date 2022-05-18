import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed:(){

            },
            icon:Icon(Icons.arrow_back_ios, color: Colors.black, size: 17,)),
        elevation: 0,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [

            Container(
              height: MediaQuery.of(context).size.height*0.1,
            ),


            Padding(
                padding: EdgeInsets.all(10),
                child: Text("BEUNIQUE", style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
            ),


            Container(
              height: MediaQuery.of(context).size.height*0.1,
            ),

//            Container(
//              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//              width: size.width,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//                  Text(""),
//                  Text("Login")
//                ],
//              ),
//            ),


            Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),

                        padding: EdgeInsets.all(10),

                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                        child: TextFormField(

                          decoration: InputDecoration(
                              hintText: "First Name",
                              border: InputBorder.none
                          ),

                        ),

                      ),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),

                        padding: EdgeInsets.all(10),

                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                        child: TextFormField(

                          decoration: InputDecoration(
                              hintText: "Surname",
                              border: InputBorder.none
                          ),

                        ),



                      ),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),

                        padding: EdgeInsets.all(10),

                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                        child: TextFormField(

                          decoration: InputDecoration(
                              hintText: "Email Address",
                              border: InputBorder.none
                          ),

                        ),


                      ),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),

                        padding: EdgeInsets.all(10),

                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                        child: TextFormField(

                          decoration: InputDecoration(
                              hintText: "Password",
                              border: InputBorder.none
                          ),

                        ),



                      ),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),

                        padding: EdgeInsets.all(10),

                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                        child: TextFormField(

                          decoration: InputDecoration(
                              hintText: "Confirm Password",
                              border: InputBorder.none
                          ),

                        ),



                      ),

            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),

              padding: EdgeInsets.all(10),

              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

              child: Row(
                children: [

                    Container(
                        width: size.width*0.1,
                        child:Text("+234")),

                Container(
                  width: size.width*0.7,
                  child: TextFormField(

              decoration: InputDecoration(
              hintText: "Phone Number",
                  border: InputBorder.none
              )),)

                ],
              )

              ),

            Container(

              padding: EdgeInsets.all(10),

              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

              child: FlatButton(
                onPressed: (){

                },
                child: Text("Sign Up",style: TextStyle(color:Colors.black),),
              )



            ),


                Column(
                  children: [

                    Container(
                      height: MediaQuery.of(context).size.height*0.1,
                    ),

                    Container(

                      padding: EdgeInsets.all(30),
                      child: Text("BEUNIQUE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),

                    ),
                    Container(

                      padding: EdgeInsets.only(bottom: 30),
                      child: Text("© ${2022}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),

                    )

                  ],
                )







                    ],
                  ),




                )
        );


  }
}
