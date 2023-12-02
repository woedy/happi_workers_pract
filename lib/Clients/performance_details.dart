import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_documents.dart';
import 'package:happi_workers_pract/constants.dart';

class PerformanceDetails extends StatefulWidget {
  const PerformanceDetails({super.key});

  @override
  State<PerformanceDetails> createState() => _PerformanceDetailsState();
}

class _PerformanceDetailsState extends State<PerformanceDetails> {
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
                                            "Performance",
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



                                      Text(
                                        "Discharge End Letter",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: happiPrimary
                                        ),
                                      ),


                                      SizedBox(
                                        height: 10,
                                      ),



                                      Text(
                                        "Please complete below",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: happiPrimary
                                        ),
                                      ),

                                      SizedBox(
                                        height: 20,
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
                                        height: 20,
                                      ),


                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Counselling Assessment 1"),
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
                                                      labelText: "PHQ 9 Score",
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

                                                Text("Counselling Assessment 2"),
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
                                                      labelText: "GAD-7 Score",
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

                                                Text("Treatment goals agreed"),
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

                                                Text("Over how many sessions"),
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
                                                      labelText: "Number",
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
                                              height: 30,
                                            ),




                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyDocuments()));
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                  color: happiDark,
                                                  borderRadius: BorderRadius.circular(15)),
                                              child: Center(
                                                child: Text(
                                                  "Save & Preview",
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
                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyDocuments()));
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                  color: happiPrimary,
                                                  borderRadius: BorderRadius.circular(15)),
                                              child: Center(
                                                child: Text(
                                                  "Send to client",
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
