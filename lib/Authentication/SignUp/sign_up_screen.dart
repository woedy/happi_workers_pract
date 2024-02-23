import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/models/sign_up_model.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/keyboard_utils.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:http/http.dart' as http;




class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();






  String? first_name;
  String? last_name;
  String? email;
  String? password;
  String? password_confirmation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 40,
                            left: 0,
                            right: 0,
                            child: Image(
                                image: AssetImage("assets/images/stroke.png"))),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Image(
                                height: 280,
                                image: AssetImage("assets/images/conner.png"))),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            child: Image(
                                image: AssetImage("assets/images/square_c.png"))),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.red,
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                              height: 51,
                              image:
                                  AssetImage("assets/images/happi_logo.png")),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w400,
                                color: happiPrimary),
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
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.1))),
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  //hintText: 'Enter Username/Email',

                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal),
                                  labelText: "First name",
                                  labelStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(0.5)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(225),
                                  PasteTextInputFormatter(),
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'First name is required';
                                  }
                                  if (value.length < 3) {
                                    return 'Last Name too short';
                                  }
                                },
                                textInputAction: TextInputAction.next,
                                autofocus: false,
                                onSaved: (value) {
                                  setState(() {
                                    first_name = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.1))),
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  //hintText: 'Enter Username/Email',

                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal),
                                  labelText: "Last name",
                                  labelStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(0.5)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(225),
                                  PasteTextInputFormatter(),
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Last name is required';
                                  }
                                  if (value.length < 3) {
                                    return 'Last name too short';
                                  }
                                },
                                textInputAction: TextInputAction.next,
                                autofocus: false,
                                onSaved: (value) {
                                  setState(() {
                                    last_name = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.1))),
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  //hintText: 'Enter Username/Email',

                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(0.5)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(225),
                                  PasteTextInputFormatter(),
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email is required';
                                  }

                                  String pattern =
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                      r"{0,253}[a-zA-Z0-9])?)*$";
                                  RegExp regex = RegExp(pattern);
                                  if (!regex.hasMatch(value))
                                    return 'Enter a valid email address';

                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                autofocus: false,
                                onSaved: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                              ),
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


                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            KeyboardUtil.hideKeyboard(context);


                            print("###############");
                            print(first_name);
                            print(last_name);
                            print(email);

                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUpPassword(
                              first_name: first_name,
                              last_name: last_name,
                              email: email,
                            )));


                          }


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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "or",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    /*  InkWell(
                        onTap: () {
                          //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => WelcomePage2()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image:
                                    AssetImage("assets/images/gmail.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Sign up with google",
                                style: TextStyle(color: Colors.black),
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
                          //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => WelcomePage2()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: happiDark,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.1))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/images/Microsoft_logo 1.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Sign up with Microsoft",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),*/
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SignInScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "Sign in here",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: happiPrimary),
                            ),
                          ],
                        ),
                      )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
