import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/constants.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  var show_password = false;

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
        Container(
          width: MediaQuery.of(context).size.width,
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
                          //hintText: 'Enter Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  show_password = !show_password;
                                });
                              },
                              icon: Icon(
                                show_password
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                            labelText: "New Password",
                            labelStyle:
                            TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: InputBorder.none),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(225),
                          PasteTextInputFormatter(),
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*])')
                              .hasMatch(value)) {

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("- Password must be at least 8 characters long\n- Must include at least one uppercase letter,\n- One lowercase letter, one digit,\n- And one special character",),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return '';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            //password = value;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        obscureText: show_password ? false : true,
                        onSaved: (value) {
                          setState(() {
                            //password = value;
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
                          border:
                              Border.all(color: Colors.black.withOpacity(0.1))),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          //hintText: 'Enter Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  show_password = !show_password;
                                });
                              },
                              icon: Icon(
                                show_password
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal),
                            labelText: "Confirm New Password",
                            labelStyle:
                            TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: InputBorder.none),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(225),
                          PasteTextInputFormatter(),
                        ],
                        validator: (value) {
                          /*if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          if (value != password) {
                            return 'Passwords do not match';
                          }
                          return null;*/
                        },
                        onChanged: (value) {
                          setState(() {
                            //password_confirmation = value;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        obscureText: show_password ? false : true,
                        onSaved: (value) {
                          setState(() {
                           // password_confirmation = value;
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
                  //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => WelcomePage2()));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: happiPrimary,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Update New Password",
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
            ],
          ),
        )
      ],
    )));
  }
}
