import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Appointments/my_appointments.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Clients/meet_your_clients.dart';
import 'package:happi_workers_pract/Components/add_button_dialogbox.dart';
import 'package:happi_workers_pract/Earnings/earnings_screen.dart';
import 'package:happi_workers_pract/Home/home_screen.dart';
import 'package:happi_workers_pract/Notifications/notifications.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/Onboarding/registration_verification.dart';
import 'package:happi_workers_pract/Profile/personal_info.dart';
import 'package:happi_workers_pract/Settings/faqs_screen.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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

                                        ],
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => NotificationsScreen()));

                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: happiPrimary.withOpacity(0.2),
                                                borderRadius: BorderRadius.circular(100)
                                              ),
                                              child: Icon(Icons.notifications, color: happiPrimary,),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PersonalInfo()));

                                            },
                                            child: CircleAvatar(
                                              radius: 30,
                                              backgroundImage: AssetImage("assets/images/user.png"),
                                            ),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Settings", style: TextStyle( fontSize: 48),),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyAppointments()));

                                              },
                                              child: Row(
                                                children: [
                                                  Icon(Icons.medical_services_outlined, size: 25,),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("Appointments", style: TextStyle(fontSize: 16),),
                                                ],
                                              ),
                                            ),
                                            Icon(Icons.arrow_forward_ios_outlined, size: 20,)
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FAQsScreens()));

                                              },
                                              child: Row(
                                                children: [
                                                  Icon(Icons.help_outline_outlined, size: 25,),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("FAQs", style: TextStyle(fontSize: 16),),
                                                ],
                                              ),
                                            ),
                                            Icon(Icons.arrow_forward_ios_outlined, size: 20,)
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [

                                                Text("Set account active", style: TextStyle(fontSize: 16),),
                                              ],
                                            ),
                                            CupertinoSwitch(
                                              value: true,
                                              onChanged: (bool value) {  },
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [

                                                Text("Message Option", style: TextStyle(fontSize: 16),),
                                              ],
                                            ),
                                            CupertinoSwitch(
                                              value: true,
                                              onChanged: (bool value) {  },
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 120,
                                    ),

                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                clearApiKey();

                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => SignInScreen()),
                                                      (route) => false,
                                                );
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(Icons.logout, size: 25,),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("Log Out", style: TextStyle(fontSize: 16),),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),


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
                                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                        },
                                    child: Column(
                                      children: [
                                        Icon(Icons.home_outlined, color: Colors.black,),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text('Home', style: TextStyle(color: Colors.black, fontSize: 12),),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EarningsScreen()));
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
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AddButtonDialogBox();
                                        },
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Icon(Icons.add_circle_outline, color: Colors.black, size: 40,),

                                      ],
                                    ),
                                  ),

                                  InkWell(
                                    onTap: (){

                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MeetYourClients()));

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
                                        Icon(Icons.settings, color: happiGreen,),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text('Settings', style: TextStyle(color: happiGreen, fontSize: 12)),
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


  Future<void> clearApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("API_Key");

  }




}
