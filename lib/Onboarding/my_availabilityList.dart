import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/generic_error_dialog_box.dart';
import 'package:happi_workers_pract/Components/generic_loading_dialogbox.dart';
import 'package:happi_workers_pract/Components/generic_success_dialog_box.dart';
import 'package:happi_workers_pract/Onboarding/models/practiced_detail_model.dart';
import 'package:happi_workers_pract/Onboarding/my_device_check.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/Onboarding/recurring_availability.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

Future<PracticedDetailModel> update_availability(data) async {
  try {
    print("FUNCTION CALL..!!!!!!");

    final response = await http.post(
      Uri.parse(hostName + "/profile/availabilities"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + "10|Hw6CCoRmcETHdgp6uuitvFvkmjzx21aS0JEJEwaJe88e3b00"
      },
      body: jsonEncode({
        "minimum_booking_time_frame": data["minimum_booking_time_frame"],
        "timezone": data["timezone"],
        "availability": data["availability"],
      }),
    );

    print("RESPONSE STATUS CODE: ${response.statusCode}");
    print("RESPONSE BODY: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = json.decode(response.body);
      if (result != null) {
        //await saveUserData(result['userData']);
      }
      return PracticedDetailModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 422 || response.statusCode == 403) {
      return PracticedDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print("EXCEPTION: $e");
    throw e;
  }
}


class MyAvailabilityList extends StatefulWidget {
  final availability_data;
  final minimum_booking_time_frame;

  const MyAvailabilityList({super.key, required this.availability_data, required this.minimum_booking_time_frame});

  @override
  State<MyAvailabilityList> createState() => _MyAvailabilityListState();
}

class _MyAvailabilityListState extends State<MyAvailabilityList> {
  final _formKey = GlobalKey<FormState>();
  String? selectedInterval;


  Future<PracticedDetailModel>? _futureUpdateAvailability;


  @override
  Widget build(BuildContext context) {
    return (_futureUpdateAvailability == null) ? buildColumn() : buildFutureBuilder();
  }

  buildColumn(){
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
                                    itemCount: widget.availability_data.length,
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
                                                    crossAxisAlignment: CrossAxisAlignment.start,

                                                    children: [
                                                      Text(widget.availability_data[index]["date"], style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),),
                                                      Column(
                                                        children: [
                                                          ...widget.availability_data[index]["time"].map((time) => Row(
                                                            children: [
                                                              Icon(Icons.access_time_sharp),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text("$time", style: TextStyle(fontSize: 12, color: Colors.black),),
                                                            ],
                                                          ),)
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
                                var _data = {
                                  "minimum_booking_time_frame": widget.minimum_booking_time_frame.split(" ")[0],
                                  "timezone": "Europe/Dublin",
                                  "availability": widget.availability_data
                                };

                                print(_data);

                                setState(() {
                                  _futureUpdateAvailability =  update_availability(_data);

                                });

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

  FutureBuilder<PracticedDetailModel> buildFutureBuilder() {
    return FutureBuilder<PracticedDetailModel>(
        future: _futureUpdateAvailability,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);

            if(data.message == "Availability set successfully") {

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "Availability updated.");
                    }
                );
                Future.delayed(Duration(milliseconds: 500), () {
                  // Pop the dialog
                  //Navigator.of(context).pop();

                  // Navigate to the dashboard
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyDeviceCheck()),
                  );
                });




              });


            }

            else  {
              WidgetsBinding.instance.addPostFrameCallback((_) {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyAvailabilityList(availability_data: widget.availability_data, minimum_booking_time_frame: widget.minimum_booking_time_frame))
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return ErrorDialogBox(text: 'Error saving data',);
                    }
                );
              });

            }



          }

          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please Wait...")
                ],
              ),
            ),
          );


        }
    );
  }












}
