import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Messages/chats_screen.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/Onboarding/registration_verification.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyChatScreen extends StatefulWidget {
  const MyChatScreen({super.key});

  @override
  State<MyChatScreen> createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
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
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Hi, ",
                                            style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "Theresa",
                                            style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w400,
                                                color: happiPrimary),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: happiPrimary.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(100)
                                            ),
                                            child: Icon(Icons.notifications, color: happiPrimary,),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CircleAvatar(
                                            radius: 30,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 15,
                                  ),


                                ],
                              ),
                            ),


                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(horizontal: 20,),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("My Chat", style: TextStyle( fontSize: 48),),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    Expanded(
                                      child: ListView(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChatsScreen()));

                                            },
                                            child: Row(
                                              children: [
                                                Stack(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 35,
                                                    ),
                                                    Positioned(
                                                      bottom: 0,
                                                      right: 0,
                                                      child: CircleAvatar(
                                                        radius: 10,
                                                        backgroundColor: Colors.green,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Julia Reddington", style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold),),
                                                      Text("Hi, I accidentally deleted some important files from my account. Is there any way to recover them?", style: TextStyle( fontSize: 12,),),
                                                      Text("16 Minutes ago", style: TextStyle( fontSize: 8, color: Colors.grey),),
                                                    ],
                                                  ),
                                                )
                                              ],

                                            ),
                                          )
                                        ],
                                      ),
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
                                  InkWell(
                                    onTap: (){
                                      /*      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
                      */  },
                                    child: Column(
                                      children: [
                                        Icon(Icons.home_outlined, color: happiGreen,),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text('Home', style: TextStyle(color: happiGreen, fontSize: 12),),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => RadioScreen()));
                                    },
                                    child: Column(
                                      children: [
                                        Icon(Icons.credit_card_rounded, color: Colors.black),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text('Earnings', style: TextStyle(color: Colors.black, fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){

                                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserProfileScreen()));

                                    },
                                    child: Column(
                                      children: [
                                        Icon(Icons.add_circle_outline, color: Colors.black, size: 40,),

                                      ],
                                    ),
                                  ),

                                  InkWell(
                                    onTap: (){

                                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserProfileScreen()));

                                    },
                                    child: Column(
                                      children: [
                                        Icon(Icons.people_alt_outlined, color: Colors.black,),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text('Profile', style: TextStyle(color: Colors.black, fontSize: 12)),
                                      ],
                                    ),
                                  ),

                                  InkWell(
                                    onTap: (){

                                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SettingsScreen()));

                                    },
                                    child: Column(
                                      children: [
                                        Icon(Icons.settings, color: Colors.black,),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text('Settings', style: TextStyle(color: Colors.black, fontSize: 12)),
                                      ],
                                    ),
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
