import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/Password/password_confirm.dart';
import 'package:happi_workers_pract/constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  var show_password = false;

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
                            child: Image(image: AssetImage("assets/images/stroke.png"))),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Image(
                                height: 280,
                                image: AssetImage("assets/images/conner.png"))),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            child:
                            Image(image: AssetImage("assets/images/square_c.png"))),
                      ],
                    ),
                  ),
                ),
                Container(


                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  //color: Colors.red,
                  padding: EdgeInsets.all(20),
                  child: ListView(
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                              height: 51,
                              image: AssetImage("assets/images/happi_logo.png")),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Forgot\nPassword",
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Enter your username/email below", style: TextStyle(color: Colors.white, fontSize: 15),),
                              ],
                            ),

                            SizedBox(
                              height:15,
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
                                  labelText: "Username/Email",
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
                                    return 'Email is required';
                                  }
                                  if (value.length < 3) {
                                    return 'Name too short';
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
                                    //email = value;
                                  });
                                },
                              ),
                            ),

                            SizedBox(
                              height: 30,
                            ),

                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PasswordConfirm()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: happiPrimary,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                )
              ],
            )));
  }
}
