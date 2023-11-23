import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_availabilityList.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyAvailability extends StatefulWidget {
  const MyAvailability({super.key});

  @override
  State<MyAvailability> createState() => _MyAvailabilityState();
}

class _MyAvailabilityState extends State<MyAvailability> {
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

                                      Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: happiGreen.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Minimum time frame before clients can book an appointment with you:", style: TextStyle(fontSize: 12, color: happiPrimary),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                  border:
                                                  Border.all(color: Colors.black.withOpacity(0.1))),
                                              child: GestureDetector(
                                                onTap: () {
                                                  _showIntervalSelectionModal(context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(5),
                                                  width: 150,

                                                  //height: 10,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(
                                                          color: Colors.white.withOpacity(0.1))
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        selectedInterval ?? 'Select Interval',
                                                        style: TextStyle(fontSize: 13,
                                                            color: Colors.black.withOpacity(0.5)),
                                                      ),
                                                      Icon(Icons.arrow_drop_down, size: 30, color: Colors.black,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Container(

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Select month", style: TextStyle(fontSize: 12, color: happiPrimary),),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            Row(
                                              children: [
                                                Expanded(

                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:
                                                        Border.all(color: Colors.black.withOpacity(0.1))),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _showIntervalSelectionModal(context);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(5),
                                                        width: 150,

                                                        //height: 10,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            border: Border.all(
                                                                color: Colors.white.withOpacity(0.1))
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                               'August',
                                                              style: TextStyle(fontSize: 13,
                                                                  color: Colors.black.withOpacity(0.5)),
                                                            ),
                                                            Icon(Icons.arrow_drop_down, size: 30, color: Colors.black,),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:
                                                        Border.all(color: Colors.black.withOpacity(0.1))),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _showIntervalSelectionModal(context);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(5),
                                                        width: 150,

                                                        //height: 10,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            border: Border.all(
                                                                color: Colors.white.withOpacity(0.1))
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              '21-27 Aug. 2023',
                                                              style: TextStyle(fontSize: 13,
                                                                  color: Colors.black.withOpacity(0.5)),
                                                            ),
                                                            Icon(Icons.arrow_drop_down, size: 30, color: Colors.black,),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      Divider(
                                        thickness: 1,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Container(


                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Select a day", style: TextStyle(fontSize: 12, color: happiPrimary),),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            Container(
                                              height: 50,
                                              child: ListView(
                                                scrollDirection: Axis.horizontal,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:
                                                        Border.all(color: Colors.black.withOpacity(0.1))),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(12),
                                                        width: 150,

                                                        //height: 10,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            border: Border.all(
                                                                color: Colors.white.withOpacity(0.1))
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                         '21st August 2023',
                                                              style: TextStyle(fontSize: 13,
                                                                  color: Colors.black.withOpacity(0.5)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:
                                                        Border.all(color: Colors.black.withOpacity(0.1))),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(12),
                                                        width: 150,

                                                        //height: 10,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            border: Border.all(
                                                                color: Colors.white.withOpacity(0.1))
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              '21st August 2023',
                                                              style: TextStyle(fontSize: 13,
                                                                  color: Colors.black.withOpacity(0.5)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:
                                                        Border.all(color: Colors.black.withOpacity(0.1))),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(12),
                                                        width: 150,

                                                        //height: 10,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            border: Border.all(
                                                                color: Colors.white.withOpacity(0.1))
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              '21st August 2023',
                                                              style: TextStyle(fontSize: 13,
                                                                  color: Colors.black.withOpacity(0.5)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
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
                                      Divider(
                                        thickness: 1,
                                      ),


                                      SizedBox(
                                        height: 10,
                                      ),


                                      Container(

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Select time slots for the select day", style: TextStyle(fontSize: 12, color: happiPrimary),),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            Container(
                                              height: 50,
                                              child: ListView(
                                                scrollDirection: Axis.horizontal,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:
                                                        Border.all(color: Colors.black.withOpacity(0.1))),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(12),
                                                        width: 150,

                                                        //height: 10,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            border: Border.all(
                                                                color: Colors.white.withOpacity(0.1))
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              '10:00am',
                                                              style: TextStyle(fontSize: 13,
                                                                  color: Colors.black.withOpacity(0.5)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:
                                                        Border.all(color: Colors.black.withOpacity(0.1))),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(12),
                                                        width: 150,

                                                        //height: 10,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            border: Border.all(
                                                                color: Colors.white.withOpacity(0.1))
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              '11:00am',
                                                              style: TextStyle(fontSize: 13,
                                                                  color: Colors.black.withOpacity(0.5)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:
                                                        Border.all(color: Colors.black.withOpacity(0.1))),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(12),
                                                        width: 150,

                                                        //height: 10,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            border: Border.all(
                                                                color: Colors.white.withOpacity(0.1))
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              '12:00pm',
                                                              style: TextStyle(fontSize: 13,
                                                                  color: Colors.black.withOpacity(0.5)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
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

                                      Divider(
                                        thickness: 1,
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text("Add session to calender", style: TextStyle(fontSize: 12, color: Colors.red),),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Image(image: AssetImage("assets/images/calenbut.png")),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image(image: AssetImage("assets/images/calen1.png")),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image(image: AssetImage("assets/images/calen2.png")),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image(image: AssetImage("assets/images/calen3.png")),
                                        ],
                                      ),


                                      


                                      SizedBox(
                                        height: 20,
                                      ),


                                      InkWell(
                                        onTap: () {
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Save & Add More",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      InkWell(
                                        onTap: () {

                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyAvailabilityList()));

                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              color: happiPrimary,
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Save & Continue",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      SizedBox(
                                        height: 10,
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
