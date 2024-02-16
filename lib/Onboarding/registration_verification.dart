import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/generic_error_dialog_box.dart';
import 'package:happi_workers_pract/Components/generic_loading_dialogbox.dart';
import 'package:happi_workers_pract/Components/generic_success_dialog_box.dart';
import 'package:happi_workers_pract/Components/verification_status_dialogbox.dart';
import 'package:happi_workers_pract/Onboarding/models/user_profile_models.dart';
import 'package:happi_workers_pract/Onboarding/my_device_check.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


Future<UserProfileModel> get_verification_status() async {
  try {
    print("FUNCTION CALL..!!!!!!");

    final response = await http.get(
      Uri.parse(hostName + "/profile"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + "10|Hw6CCoRmcETHdgp6uuitvFvkmjzx21aS0JEJEwaJe88e3b00"
      },
    );

    print("RESPONSE STATUS CODE: ${response.statusCode}");
    print("RESPONSE BODY: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = json.decode(response.body);
      if (result != null) {
        //await saveUserData(result['userData']);
      }
      return UserProfileModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 422 || response.statusCode == 403) {
      return UserProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print("EXCEPTION: $e");
    throw e;
  }
}



class RegistrationVerification extends StatefulWidget {
  const RegistrationVerification({super.key});

  @override
  State<RegistrationVerification> createState() => _RegistrationVerificationState();
}

class _RegistrationVerificationState extends State<RegistrationVerification> {
  final _formKey = GlobalKey<FormState>();
  String? selectedInterval;



  Future<UserProfileModel>? _futureGetVerification;

  @override
  void initState() {
    _futureGetVerification = get_verification_status();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_futureGetVerification == null) ? buildColumn() : buildFutureBuilder();
  }

  buildColumn(){
    return Scaffold(

        body: Container());
  }

  FutureBuilder<UserProfileModel> buildFutureBuilder() {
    return FutureBuilder<UserProfileModel>(
        future: _futureGetVerification,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);

            if(data.message == "Profile data retrieved successfully") {
              var veri_status = data.data;
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

                                                    Icon(veri_status!.hasCompletedProfile! ? Icons.check_box_rounded : Icons.check_box_outline_blank, color: happiPrimary.withOpacity(0.7), size: 40,),

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

                                                    Icon(veri_status.hasCompletedDocumentsUpload! ? Icons.check_box_rounded : Icons.check_box_outline_blank, color: happiPrimary.withOpacity(0.7), size: 40,),

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

                                                    Icon(veri_status.hasSetAvailability! ? Icons.check_box_rounded : Icons.check_box_outline_blank, color: happiPrimary.withOpacity(0.7), size: 40,),

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

                                                    Icon(veri_status.hasBeenInterviewed! ? Icons.check_box_rounded : Icons.check_box_outline_blank, color: happiPrimary.withOpacity(0.7), size: 40,),

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

                                                    Icon(veri_status.hasProfileVerified! ? Icons.check_box_rounded : Icons.check_box_outline_blank, color: happiPrimary.withOpacity(0.7), size: 40,),

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
                                              "Complete Process",
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

            else  {
              WidgetsBinding.instance.addPostFrameCallback((_) {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyDeviceCheck())
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
