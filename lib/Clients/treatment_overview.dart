import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Clients/your_clinical_assessment.dart';
import 'package:happi_workers_pract/Components/generic_success_dialog_box.dart';
import 'package:happi_workers_pract/Onboarding/my_documents.dart';
import 'package:happi_workers_pract/constants.dart';

class TreatmentOverview extends StatefulWidget {
  const TreatmentOverview({super.key});

  @override
  State<TreatmentOverview> createState() => _TreatmentOverviewState();
}

class _TreatmentOverviewState extends State<TreatmentOverview> {
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
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "My Practice\nDetails",
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


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Savannah Nguyen",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w400,
                                                color: happiDark),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Paid",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),


                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Severity"),
                                                SizedBox(
                                                  height: 10,
                                                ),

                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(15),
                                                      border:
                                                      Border.all(color: Colors.black.withOpacity(0.1))),
                                                  child: TextFormField(
                                                    style: TextStyle(color: Colors.black),
                                                    decoration: InputDecoration(
                                                      //hintText: 'Enter Username/Email',

                                                      hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.normal),
                                                      labelText: "Select",
                                                      labelStyle: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black.withOpacity(0.5)),
                                                      enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.white)),
                                                      focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.white)),
                                                      border: InputBorder.none,
                                                    ),
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(225),
                                                      PasteTextInputFormatter(),
                                                    ],
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Contact name is required';
                                                      }
                                                      if (value.length < 3) {
                                                        return 'Contact too short';
                                                      }
                                                    },
                                                    textInputAction: TextInputAction.next,
                                                    autofocus: false,
                                                    onSaved: (value) {
                                                      setState(() {
                                                        //email = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),


                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("ICD-10 Code"),
                                                SizedBox(
                                                  height: 10,
                                                ),

                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(15),
                                                      border:
                                                      Border.all(color: Colors.black.withOpacity(0.1))),
                                                  child: TextFormField(
                                                    style: TextStyle(color: Colors.black),
                                                    decoration: InputDecoration(
                                                      //hintText: 'Enter Username/Email',

                                                      hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.normal),
                                                      labelText: "Select",
                                                      labelStyle: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black.withOpacity(0.5)),
                                                      enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.white)),
                                                      focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.white)),
                                                      border: InputBorder.none,
                                                    ),
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(225),
                                                      PasteTextInputFormatter(),
                                                    ],
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Contact name is required';
                                                      }
                                                      if (value.length < 3) {
                                                        return 'Contact too short';
                                                      }
                                                    },
                                                    textInputAction: TextInputAction.next,
                                                    autofocus: false,
                                                    onSaved: (value) {
                                                      setState(() {
                                                        //email = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),



                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [


                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(15),
                                                      border:
                                                      Border.all(color: Colors.black.withOpacity(0.1))),
                                                  child: TextFormField(
                                                    style: TextStyle(color: Colors.black),
                                                    decoration: InputDecoration(
                                                      //hintText: 'Enter Username/Email',

                                                      hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.normal),
                                                      labelText: "Number of recommended sessions",
                                                      labelStyle: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black.withOpacity(0.5)),
                                                      enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.white)),
                                                      focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.white)),
                                                      border: InputBorder.none,
                                                    ),
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(225),
                                                      PasteTextInputFormatter(),
                                                    ],
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Contact name is required';
                                                      }
                                                      if (value.length < 3) {
                                                        return 'Contact too short';
                                                      }
                                                    },
                                                    textInputAction: TextInputAction.next,
                                                    autofocus: false,
                                                    onSaved: (value) {
                                                      setState(() {
                                                        //email = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),




                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [


                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(15),
                                                      border:
                                                      Border.all(color: Colors.black.withOpacity(0.1))),
                                                  child: TextFormField(
                                                    style: TextStyle(color: Colors.black),
                                                    decoration: InputDecoration(
                                                      //hintText: 'Enter Username/Email',

                                                      hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight: FontWeight.normal),
                                                      labelText: "Briefly provide additional details for your treatment proposal (Optional)",
                                                      labelStyle: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black.withOpacity(0.5)),
                                                      enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.white)),
                                                      focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.white)),
                                                      border: InputBorder.none,
                                                    ),
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(225),
                                                      PasteTextInputFormatter(),
                                                    ],
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Contact name is required';
                                                      }
                                                      if (value.length < 3) {
                                                        return 'Contact too short';
                                                      }
                                                    },
                                                    textInputAction: TextInputAction.next,
                                                    autofocus: false,
                                                    maxLines: 5,
                                                    onSaved: (value) {
                                                      setState(() {
                                                        //email = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),




                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              //  return LoadingDialogBox(text: "Loading Here....",); // Display your custom dialog
                                              //return SuccessDialogBox();
                                              return SuccessDialogBox(text: 'You have successfully submitted clients treatment overview',);
                                            },
                                          );

                                          Future.delayed(Duration(seconds: 2), () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => YourClinicalAssessment()));
                                          });


                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: happiPrimary,
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Submit",
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
