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

class ProgressNoteDetails extends StatefulWidget {
  const ProgressNoteDetails({super.key});

  @override
  State<ProgressNoteDetails> createState() => _ProgressNoteDetailsState();
}

class _ProgressNoteDetailsState extends State<ProgressNoteDetails> {
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


                              Container(
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Progress Notes",
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



                                    SizedBox(
                                      height: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "October 30, 2017",
                                                style: TextStyle(
                                                  fontSize: 12,),

                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                height: 500,
                                                width: MediaQuery.of(context).size.width,
                                                padding: EdgeInsets.all(20),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Text(
                                                  "User reports that their desktop app crashed while ..  User reports that their desktop app crashed while ..  User reports that their desktop app crashed while ..  User reports that their desktop app crashed while .. ",
                                                  style: TextStyle(
                                                    fontSize: 12,),

                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(
                                            height: 20,
                                          ),

                                          InkWell(
                                            onTap: () {
                                              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyPaymentDetails()));
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                  color: happiPrimary,
                                                  borderRadius: BorderRadius.circular(15)),
                                              child: Center(
                                                child: Text(
                                                  "Edit Note",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
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
                    ),
                  ],
                )
              ],
            )));
  }



}
