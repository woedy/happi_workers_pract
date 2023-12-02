import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_documents.dart';
import 'package:happi_workers_pract/constants.dart';

class OnlineTreatment extends StatefulWidget {
  const OnlineTreatment({super.key});

  @override
  State<OnlineTreatment> createState() => _OnlineTreatmentState();
}

class _OnlineTreatmentState extends State<OnlineTreatment> {
  final _formKey = GlobalKey<FormState>();

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
                                            "Online\nAssessment",
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


                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Completion", style: TextStyle(color: happiPrimary, fontWeight: FontWeight.w900),),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("October 30, 2017"),

                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),


                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Gender", style: TextStyle(color: happiPrimary, fontWeight: FontWeight.w900),),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("Male"),

                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),



                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Date of Birth", style: TextStyle(color: happiPrimary, fontWeight: FontWeight.w900),),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("October 30, 1976"),

                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),


                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("What one thing you looking for help with", style: TextStyle(color: happiPrimary, fontWeight: FontWeight.w900),),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("Anxiety at work"),

                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),


                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Feel free to share", style: TextStyle(color: happiPrimary, fontWeight: FontWeight.w900),),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("Anxiety at work"),

                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),



                                          ],
                                        ),
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
}
