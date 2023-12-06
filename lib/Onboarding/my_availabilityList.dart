import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_device_check.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/Onboarding/recurring_availability.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyAvailabilityList extends StatefulWidget {
  const MyAvailabilityList({super.key});

  @override
  State<MyAvailabilityList> createState() => _MyAvailabilityListState();
}

class _MyAvailabilityListState extends State<MyAvailabilityList> {
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
                                      "My Availability",
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

                                Text("Your selected dates with corresponding time", style: TextStyle(fontSize: 12, color: happiPrimary),),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),


                            Expanded(
                              child: Container(
                                child: ListView.builder(
                                    itemCount: 10,
                                    itemBuilder: (context, index){
                                      return Column(
                                        children: [
                                          Container(
                                            //height: 20,

                                            child: Stack(
                                              children: [
                                                Positioned(
                                                    bottom: 0,
                                                    child: Image(image: AssetImage("assets/images/small_stroke.png"))),
                                                Container(
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius: BorderRadius.circular(10),
                                                      border:
                                                      Border.all(color: Colors.black.withOpacity(0.1))),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                    children: [
                                                      Text("21st August 2023", style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),),
                                                      Row(
                                                        children: [
                                                          Icon(Icons.access_time_sharp),
                                                          Text("10:00am", style: TextStyle(fontSize: 12, color: Colors.black),),
                                                        ],
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(
                                            height: 10,
                                          ),

                                        ],
                                      );
                                    }),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => RecurringAvailability()));

                              },
                              child: Row(
                                children: [
                                  Icon(Icons.add_box_rounded, color: happiPrimary, size: 70,),
                                  Text(
                                    "Set to recurring",
                                    style: TextStyle(
                                      fontSize: 15,
                                    color: Colors.red),

                                  ),
                                ],
                              ),
                            ),



                            InkWell(
                              onTap: () {

                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyDeviceCheck()));

                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: happiPrimary,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    "Continue",
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
