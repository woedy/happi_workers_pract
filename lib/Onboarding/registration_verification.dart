import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/verification_status_dialogbox.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationVerification extends StatefulWidget {
  const RegistrationVerification({super.key});

  @override
  State<RegistrationVerification> createState() => _RegistrationVerificationState();
}

class _RegistrationVerificationState extends State<RegistrationVerification> {
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
                        height: MediaQuery.of(context).size.height,
                        //color: Colors.red,

                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Registration\nVerification",
                                      style: TextStyle(
                                          fontSize: 48,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 15,
                                ),


                              ],
                            ),




                            Expanded(
                              child: Container(
                                child: ListView(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(30),
                                      //width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.06),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Personal Information", style: TextStyle(fontSize: 20),),

                                          Icon(Icons.check_box_rounded, color: happiPrimary.withOpacity(0.7), size: 40,),

                                        ],
                                      ),
                                    ),


                                    SizedBox(
                                      height:20,
                                    ),


                                    Container(
                                      padding: EdgeInsets.all(30),
                                      //width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.06),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Documents Uploaded", style: TextStyle(fontSize: 20),),

                                          Icon(Icons.check_box_rounded, color: happiPrimary.withOpacity(0.7), size: 40,),

                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:20,
                                    ),


                                    Container(
                                      padding: EdgeInsets.all(30),
                                      //width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.06),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Availability", style: TextStyle(fontSize: 20),),

                                          Icon(Icons.check_box_rounded, color: happiPrimary.withOpacity(0.7), size: 40,),

                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:20,
                                    ),


                                    Container(
                                      padding: EdgeInsets.all(30),
                                      //width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.06),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Device Check", style: TextStyle(fontSize: 20),),

                                          Icon(Icons.check_box_rounded, color: happiPrimary.withOpacity(0.7), size: 40,),

                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height:20,
                                    ),


                                    Container(
                                      padding: EdgeInsets.all(30),
                                      //width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.06),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Interviewed", style: TextStyle(fontSize: 20),),

                                          Icon(Icons.check_box_rounded, color: happiPrimary.withOpacity(0.7), size: 40,),

                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height:20,
                                    ),


                                    Container(
                                      padding: EdgeInsets.all(30),
                                      //width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.06),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Practitioner Profile is Live", style: TextStyle(fontSize: 20),),

                                          Icon(Icons.check_box_rounded, color: happiPrimary.withOpacity(0.7), size: 40,),

                                        ],
                                      ),
                                    ),




                                  ],
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),



                            InkWell(
                              onTap: () {

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    //  return LoadingDialogBox(text: "Loading Here....",); // Display your custom dialog
                                    //return SuccessDialogBox();
                                    return VerificationStatusDialogbox();
                                  },
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: happiPrimary,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    "Perform Device Check Now",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),


                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }




  void _showIntervalSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('1 hour'),
                onTap: () {
                  setState(() {
                    selectedInterval = '1 hour';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('6 hours'),
                onTap: () {
                  setState(() {
                    selectedInterval = '6 hours';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('8 hours'),
                onTap: () {
                  setState(() {
                    selectedInterval = '8 hours';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('12 hours'),
                onTap: () {
                  setState(() {
                    selectedInterval = '12 hours';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text('24 hours'),
                onTap: () {
                  setState(() {
                    selectedInterval = '24 hours';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }





}
