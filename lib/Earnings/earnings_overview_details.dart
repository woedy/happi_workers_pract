import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_availability.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EarningsOverviewDetails extends StatefulWidget {
  const EarningsOverviewDetails({super.key});

  @override
  State<EarningsOverviewDetails> createState() => _EarningsOverviewDetailsState();
}

class _EarningsOverviewDetailsState extends State<EarningsOverviewDetails> {
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
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [


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
                                      height: 30,
                                    ),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Appointment Date",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "22nd January 2023",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: happiPrimary),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),


                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Appointment Time",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "2:00PM",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: happiPrimary),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),


                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Payment Date",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "22nd January 2023",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: happiPrimary),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),


                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Appointment Purpose",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Stress living alone on campus",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: happiPrimary),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            color: happiPrimary,
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Center(
                                          child: Text(
                                            "Back to the Dashboard",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 30,
                                    ),

                                  ],
                                ),
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
