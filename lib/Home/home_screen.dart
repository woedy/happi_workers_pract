import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Clients/meet_your_clients.dart';
import 'package:happi_workers_pract/Components/add_button_dialogbox.dart';
import 'package:happi_workers_pract/Components/generic_loading_dialogbox.dart';
import 'package:happi_workers_pract/Earnings/earnings_screen.dart';
import 'package:happi_workers_pract/Notifications/notifications.dart';
import 'package:happi_workers_pract/Onboarding/models/user_profile_models.dart';
import 'package:happi_workers_pract/Onboarding/my_availability.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/Onboarding/registration_verification.dart';
import 'package:happi_workers_pract/Profile/models/appointments_model.dart';
import 'package:happi_workers_pract/Profile/personal_info.dart';
import 'package:happi_workers_pract/Settings/settings_screen.dart';
import 'package:happi_workers_pract/VideoCall/video_call_screen.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<UserProfileModel> get_user_data() async {
    var token = await getApiPref();
    print(token);
    
    try {
      print("FUNCTION CALL..!!!!!!");

      final response = await http.get(
        Uri.parse(hostName + "/profile"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token.toString(),
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


  Future<MyAppointmentsModel> get_appointment() async {
    var token = await getApiPref();
    print(token);

    try {
      print("FUNCTION CALL..!!!!!!");

      final response = await http.get(
        Uri.parse(hostName + "/appointments"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token.toString(),
        },
      );

      print("RESPONSE STATUS CODE: ${response.statusCode}");
      print("RESPONSE BODY: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = json.decode(response.body);
        if (result != null) {
          //await saveUserData(result['userData']);
        }
        return MyAppointmentsModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 422 || response.statusCode == 403) {
        return MyAppointmentsModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("EXCEPTION: $e");
      throw e;
    }
  }

  final _formKey = GlobalKey<FormState>();
  String? selectedInterval;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          get_user_data(),
          get_appointment(),
          //_fetchReceivers(),
          //_fetchHistory(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final userData = snapshot.data![0];
            print(userData);
            final appointments = snapshot.data![1];
            //final history = snapshot.data![2];

            // Check if any of the data is null (indicating an error)
            if (userData == null) {
              return Center(
                child: Text('Error: Some data could not be fetched'),
              );
            }


            return SafeArea(
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
                                              Text(
                                                "Hi, ",
                                                style: TextStyle(
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                userData.data.firstName.toString(),
                                                style: TextStyle(
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.w400,
                                                    color: happiPrimary),
                                              ),
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
                                                  backgroundImage: NetworkImage(userData.data.avatar.toString()),
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
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Appointments", style: TextStyle(color: happiPrimary, fontSize: 24),),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Text("Up coming", style: TextStyle(color: happiPrimary, fontSize: 12),),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: 2,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      color: happiPrimary
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Previous", style: TextStyle(color: happiPrimary, fontSize: 12),),

                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        
                                        if(appointments.message == "You have no appointments yet")...[
                                          Expanded(
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Container(
                                                  height: 209,
                                                  width: 335,
                                                  decoration: BoxDecoration(
                                                    color: happiDark,
                                                    borderRadius: BorderRadius.circular(20),

                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("You have no upcoming appointments yet!", style: TextStyle(color: Colors.white, fontSize: 10),),
                                                      SizedBox(
                                                        height: 40,
                                                      ),

                                                      InkWell(
                                                        onTap: (){
                                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyAvailability()));

                                                        },
                                                        child: Container(
                                                            padding: EdgeInsets.all(15),
                                                            width: 250,
                                                            decoration: BoxDecoration(
                                                              color: happiGreen,
                                                              borderRadius: BorderRadius.circular(15),

                                                            ),

                                                            child: Center(child: Text("Schedule an appointment", style: TextStyle(color: Colors.black, fontSize: 10),))),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              
                                              ],
                                            ),
                                          ),
                                        ]else...[
                                          Expanded(
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                             
                                                Container(
                                                  height: 209,
                                                  width: 335,
                                                  decoration: BoxDecoration(
                                                    color: happiDark,
                                                    borderRadius: BorderRadius.circular(20),

                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal:15.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,

                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                              children: [
                                                                Row(
                                                                  children: [

                                                                    CircleAvatar(
                                                                      backgroundImage: AssetImage("assets/images/user2.png"),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text("Julia Reddington", style: TextStyle(color: Colors.white, fontSize: 12),),
                                                                  ],
                                                                ),
                                                                Icon(Icons.info_outline, color: Colors.white,)
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text("9/23/16 at 10Am", style: TextStyle(color: happiGreen, fontWeight: FontWeight.w900, fontSize: 15),),
                                                            Text("curtis.weaver@example.com", style: TextStyle(color: Colors.white, fontSize: 12),),

                                                            SizedBox(
                                                              height: 40,
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [


                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: (){
                                                                  showDialog(
                                                                    context: context,
                                                                    builder: (BuildContext context) {
                                                                      //  return LoadingDialogBox(text: "Loading Here....",); // Display your custom dialog
                                                                      //return SuccessDialogBox();
                                                                      return LoadingDialogBox(text: 'Wait as your session loads',);
                                                                    },
                                                                  );

                                                                  Future.delayed(Duration(seconds: 2), () {
                                                                    Navigator.of(context).pop();
                                                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => VideoCallScreen()));
                                                                  });

                                                                },
                                                                child: Container(
                                                                    padding: EdgeInsets.all(15),
                                                                    width: 120,
                                                                    decoration: BoxDecoration(
                                                                      color: happiGreen,
                                                                      borderRadius: BorderRadius.circular(20),

                                                                    ),

                                                                    child: Center(child: Text("Join", style: TextStyle(color: Colors.black, fontSize: 10),))),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Container(
                                                                  padding: EdgeInsets.all(15),
                                                                  width: 120,
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.white,
                                                                    borderRadius: BorderRadius.circular(20),

                                                                  ),

                                                                  child: Center(child: Text("Cancel", style: TextStyle(color: Colors.black, fontSize: 10),))),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],

                                       
                                        SizedBox(
                                          height: 10,
                                        ),
          if(appointments.message != "You have no appointments yet")...[
            Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 4,
                                              backgroundColor: happiPrimary,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),

                                            CircleAvatar(
                                              radius: 4,
                                              backgroundColor: happiPrimary.withOpacity(0.5),

                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),

                                            CircleAvatar(
                                              radius: 4,
                                              backgroundColor: happiPrimary.withOpacity(0.5),

                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),

                                            CircleAvatar(
                                              radius: 4,
                                              backgroundColor: happiPrimary.withOpacity(0.5),

                                            ),
                                          ],
                                        )
          ]


                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    color: happiDark,
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [

                                            Text("Insights", style: TextStyle(color: Colors.white, fontSize: 24),),
                                            Icon(Icons.ssid_chart, color: Colors.red,)
                                          ],
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),

                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(

                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 160,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                                right: 5,
                                                                top: 5,
                                                                child: Image(image: AssetImage("assets/images/arrow.png"))),
                                                            Positioned(
                                                              top: 0,
                                                              right: 0,
                                                              left: 0,
                                                              bottom: 0,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text("Completed\nsessions ever", style: TextStyle( fontSize: 15),),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text("15% Increase from last week", style: TextStyle( fontSize: 10),),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text("0", style: TextStyle( fontSize: 40),),

                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 160,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                                right: 5,
                                                                top: 5,
                                                                child: Image(image: AssetImage("assets/images/arrow.png"))),
                                                            Positioned(
                                                              top: 0,
                                                              right: 0,
                                                              left: 0,
                                                              bottom: 0,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text("Completed\nHours ever", style: TextStyle( fontSize: 15),),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text("5% Increase from last week", style: TextStyle( fontSize: 10),),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text("0h", style: TextStyle( fontSize: 40),),

                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 160,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                                right: 5,
                                                                top: 5,
                                                                child: Image(image: AssetImage("assets/images/arrowred.png"))),
                                                            Positioned(
                                                              top: 0,
                                                              right: 0,
                                                              left: 0,
                                                              bottom: 0,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text("Completed\nsessions ever", style: TextStyle( fontSize: 15),),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text("15% Increase from last week", style: TextStyle( fontSize: 10),),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text("0", style: TextStyle( fontSize: 40),),

                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 160,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(10)
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                                right: 5,
                                                                top: 5,
                                                                child: Image(image: AssetImage("assets/images/arrow.png"))),
                                                            Positioned(
                                                              top: 0,
                                                              right: 0,
                                                              left: 0,
                                                              bottom: 0,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text("Completed\nHours ever", style: TextStyle( fontSize: 15),),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text("5% Increase from last week", style: TextStyle( fontSize: 10),),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text("0h", style: TextStyle( fontSize: 40),),

                                                                ],
                                                              ),
                                                            ),
                                                          ],
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
                                          /*      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
                      */  },
                                        child: Column(
                                          children: [
                                            Icon(Icons.home_outlined, color: happiGreen,),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text('Home', style: TextStyle(color: happiGreen, fontSize: 12),),
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

                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SettingsScreen()));

                                        },
                                        child: Column(
                                          children: [
                                            Icon(Icons.settings, color: Colors.black,),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text('Settings', style: TextStyle(color: Colors.black, fontSize: 12)),
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
                ));
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }








}
