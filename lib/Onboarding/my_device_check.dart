import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/generic_loading_dialogbox.dart';
import 'package:happi_workers_pract/Components/generic_success_dialog_box.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/Onboarding/registration_verification.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyDeviceCheck extends StatefulWidget {
  const MyDeviceCheck({super.key});

  @override
  State<MyDeviceCheck> createState() => _MyDeviceCheckState();
}

class _MyDeviceCheckState extends State<MyDeviceCheck> {
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
                                      "My Device\nCheck",
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
                                child: Column(
                                  children: [

                                    Icon(Icons.phonelink_setup_rounded, size: 100,),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Container(
                                     // height: 200,
                                        padding: EdgeInsets.all(20),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            border:
                                            Border.all(color: Colors.black.withOpacity(0.1))),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text("Is your device compatible?", style: TextStyle(color: happiPrimary, fontSize: 14),),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text("Click on the below button to conduct a device check to ensure that your camera, speakers and microphone is working for you to connect with clients ?", style: TextStyle( fontSize: 12),),

                                          SizedBox(
                                            height: 40,
                                          ),
                                        ],
                                      ),
                                    )


                                  ],
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),



                            InkWell(
                              onTap: () {

                                saveStatus("My Device Check Complete");

                                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                  showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        // Show the dialog
                                        return LoadingDialogBox(text: 'Hold on tight! Almost complete',);
                                      }
                                  );
                                  Future.delayed(Duration(seconds: 3), () {

                                    showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (BuildContext context) {
                                          // Show the dialog
                                          return SuccessDialogBox(text: 'Your device has passed the check ',);
                                        }
                                    );

                                    Future.delayed(Duration(seconds: 2), () {


                                      // Navigate to the dashboard
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => RegistrationVerification()),
                                      );
                                    });


                                  });





                                });

                                //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => RegistrationVerification()));


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
