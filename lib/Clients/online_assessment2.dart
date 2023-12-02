import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_documents.dart';
import 'package:happi_workers_pract/constants.dart';

class OnlineTreatment2 extends StatefulWidget {
  const OnlineTreatment2({super.key});

  @override
  State<OnlineTreatment2> createState() => _OnlineTreatment2State();
}

class _OnlineTreatment2State extends State<OnlineTreatment2> {
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


                                   Expanded(
                                       child: Column(
                                         children: [
                                           Icon(Icons.warning_amber, size: 80, color: happiPrimary,),
                                           Text(
                                             "Your client has not completed the outcome measure assessment",
                                             textAlign: TextAlign.center,
                                             style: TextStyle(
                                                 fontSize: 15,
                                                 fontWeight: FontWeight.w900,


                                                 ),
                                           ),

                                           SizedBox(
                                             height: 30,
                                           ),


                                           Text(
                                             "Remind them to do so before upcoming session with you",
                                             style: TextStyle(
                                                 fontSize: 15,
                                                 fontWeight: FontWeight.w400,
                                                 ),
                                           ),
                                           SizedBox(
                                             height: 300,
                                           ),

                                           InkWell(
                                             onTap: () {
                                               //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EditPracticedDetails()));
                                             },
                                             child: Container(
                                               padding: EdgeInsets.all(20),
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
                                             height: 20,
                                           ),
                                         ],
                                       )
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
