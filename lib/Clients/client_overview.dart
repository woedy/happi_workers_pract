import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Appointments/my_appointments.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Clients/progress_notes.dart';
import 'package:happi_workers_pract/Clients/your_clinical_assessment.dart';
import 'package:happi_workers_pract/Messages/chats_screen.dart';
import 'package:happi_workers_pract/Onboarding/my_availability.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ClientsOverview extends StatefulWidget {
  const ClientsOverview({super.key});

  @override
  State<ClientsOverview> createState() => _ClientsOverviewState();
}

class _ClientsOverviewState extends State<ClientsOverview> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  String? selectedCertificate;


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
                                            "Overview",
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

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Savannah Nguyen",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w400,
                                                color: happiDark),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Paid",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundImage: AssetImage("assets/images/user3.png"),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Age: ",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "35",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Gender: ",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "Male",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "GP Details: ",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "N/A",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Region: ",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "UK",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Risk: ",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "N/A",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Total Hours: ",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "30",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),



                                      SizedBox(
                                        height: 20,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [

                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: (){
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChatsScreen()));

                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(35),
                                                        decoration: BoxDecoration(
                                                          color: happiDark,
                                                          borderRadius: BorderRadius.circular(20)
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Icon(Icons.message, size: 40, color: Colors.white,),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Text(
                                                              "Mesages\n ",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors.white),
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                        onTap: (){
                                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyAppointments()));

                                                        },
                                                      child: Container(
                                                        padding: EdgeInsets.all(35),
                                                        decoration: BoxDecoration(
                                                          color: happiDark,
                                                          borderRadius: BorderRadius.circular(20)
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Icon(Icons.video_camera_front_outlined, size: 40, color: Colors.white,),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Text(
                                                              "Appointments\n ",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors.white),
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [

                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: (){
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProgressNotes()));

                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(35),
                                                        decoration: BoxDecoration(
                                                          color: happiDark,
                                                          borderRadius: BorderRadius.circular(20)
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Icon(Icons.add_box_rounded, size: 40, color: Colors.white,),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Text(
                                                              "Notes\n ",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors.white),
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: (){
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => YourClinicalAssessment()));

                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(35),
                                                        decoration: BoxDecoration(
                                                          color: happiDark,
                                                          borderRadius: BorderRadius.circular(20)
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Icon(Icons.video_camera_front_outlined, size: 40, color: Colors.white,),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Center(
                                                              child: Text(
                                                                "Clinical\nAssessment",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                    fontSize: 15,

                                                                    color: Colors.white,),
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }



}
