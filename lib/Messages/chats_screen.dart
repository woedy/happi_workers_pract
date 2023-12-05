import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/Onboarding/registration_verification.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedInterval;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
            bottom: false,

            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [

                      Positioned(
                          top: 0,
                          right: 0,
                          child: Image(
                              height: 280,
                              image: AssetImage("assets/images/conner.png"))),

                    ],
                  ),
                ),
                Column(
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                        ],
                      ),
                    ),

                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        //color: Colors.red,

                        //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              //color: Colors.red,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image(
                                            image: AssetImage("assets/images/Back_b.png")),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Back", style: TextStyle(fontSize: 20),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                ],
                              ),
                            ),


                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(horizontal: 20,),
                                //color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [


                                    Text(
                                      "Julia Reddington",
                                      style: TextStyle(
                                          fontSize: 48,
                                          fontWeight: FontWeight.w400,
                                     ),
                                    ),


                                    SizedBox(
                                      height: 20 ,
                                    ),
                                    Expanded(
                                        child: ListView(
                                          children: [

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(20),
                                                  width: MediaQuery.of(context).size.width /2,
                                                  decoration: BoxDecoration(
                                                    color: happiLghtPurple,
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(30),
                                                        bottomLeft: Radius.circular(30),
                                                        topRight: Radius.circular(30),
                                                    )

                                                  ),
                                                  child: Text("Hello , How you doing?"),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: AssetImage("assets/images/user.png"),

                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20 ,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [

                                                CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: AssetImage("assets/images/user2.png"),

                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(20),
                                                  width: MediaQuery.of(context).size.width /2,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(30),
                                                        bottomLeft: Radius.circular(0),
                                                        topRight: Radius.circular(30),
                                                        bottomRight: Radius.circular(30),
                                                      )

                                                  ),
                                                  child: Text("Hello , How you doing?"),
                                                ),


                                              ],
                                            ),
                                            SizedBox(
                                              height: 20 ,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [

                                                CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: AssetImage("assets/images/user2.png"),

                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(20),
                                                  width: MediaQuery.of(context).size.width /2,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(30),
                                                        bottomLeft: Radius.circular(0),
                                                        topRight: Radius.circular(30),
                                                        bottomRight: Radius.circular(30),
                                                      )

                                                  ),
                                                  child: Text("Hello , How you doing?"),
                                                ),


                                              ],
                                            ),
                                          ],
                                        )
                                    )




                                  ],
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          border:
                                          Border.all(color: Colors.black.withOpacity(0.1))),
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          //hintText: 'Enter Password',

                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal),
                                            labelText: "Enter your Message",
                                            labelStyle:
                                            TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white)),
                                            border: InputBorder.none),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(225),
                                          PasteTextInputFormatter(),
                                        ],
                                        validator: (value) {

                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            //password = value;
                                          });
                                        },
                                        textInputAction: TextInputAction.next,
                                        onSaved: (value) {
                                          setState(() {
                                            //password = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: happiPrimary,
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Icon(Icons.send, color: Colors.white,),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),

                                ],
                              ),
                            )


                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }






}
