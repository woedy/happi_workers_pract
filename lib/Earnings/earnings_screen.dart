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

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
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
                                    height: 5,
                                  ),


                                ],
                              ),
                            ),


                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  //color: Colors.red,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [


                                      SingleChildScrollView(
                                        child: Container(
                                          height: MediaQuery.of(context).size.height,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Earnings",
                                                    style: TextStyle(
                                                        fontSize: 48,
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(
                                                height: 10,
                                              ),

                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15),
                                                    border:
                                                    Border.all(color: Colors.black.withOpacity(0.1))),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        style: TextStyle(color: Colors.black),
                                                        decoration: InputDecoration(
                                                          //hintText: 'Enter Username/Email',

                                                          hintStyle: TextStyle(
                                                              color: Colors.black.withOpacity(0.7),
                                                              fontWeight: FontWeight.normal),
                                                          labelText: "Search here",

                                                          labelStyle: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors.black.withOpacity(0.5)),
                                                          enabledBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.white)),
                                                          focusedBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.white)),
                                                          border: InputBorder.none,
                                                        ),
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(225),
                                                          PasteTextInputFormatter(),
                                                        ],

                                                        textInputAction: TextInputAction.next,
                                                        autofocus: false,
                                                        onSaved: (value) {
                                                          setState(() {
                                                            //email = value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.list_alt_outlined),
                                                        SizedBox(
                                                          width: 10 ,
                                                        ),
                                                        Icon(Icons.search),

                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),

                                              Expanded(
                                                child: GridView.builder(
                                                  itemCount: 20, // Number of items in the grid
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2, // Number of columns
                                                    crossAxisSpacing: 8.0, // Spacing between columns
                                                    mainAxisSpacing: 8.0, // Spacing between rows
                                                  ),
                                                  itemBuilder: (BuildContext context, int index) {
                                                    // Replace this container with your custom widget for each grid item
                                                    return Container(

                                                      padding: EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        color: Colors.white

                                                      ),

                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 23,
                                                              ),
                                                              SizedBox(
                                                                width: 10 ,
                                                              ),
                                                              Expanded(
                                                                  child: Text("Savannah Nguyen edfsfds",  style: TextStyle(fontSize: 14),
                                                                  ))
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text("30 hours",  style: TextStyle(fontSize: 14)),
                                                              Text("Paid",  style: TextStyle(fontSize: 10, color: Colors.green)),
                                                            ],
                                                          ),

                                                          Container(
                                                            width: MediaQuery.of(context).size.width,
                                                            padding: EdgeInsets.all(5),
                                                            decoration: BoxDecoration(
                                                              color: happiPrimary,
                                                              borderRadius: BorderRadius.circular(10)
                                                            ),
                                                            child: Center(child: Text("Select", style: TextStyle(color: Colors.white),)),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),





                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
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
                                        Text('Clients', style: TextStyle(color: Colors.black, fontSize: 12)),
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
