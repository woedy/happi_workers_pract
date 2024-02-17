import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/models/sign_up_model.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/verify_email.dart';
import 'package:happi_workers_pract/Components/generic_error_dialog_box.dart';
import 'package:happi_workers_pract/Components/generic_loading_dialogbox.dart';
import 'package:happi_workers_pract/Components/generic_success_dialog_box.dart';
import 'package:happi_workers_pract/Components/keyboard_utils.dart';
import 'package:happi_workers_pract/Onboarding/onboarding_1.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



Future<SignUpModel> signUpUser(String first_name, String last_name, String email, String password, String password_confirmation) async {

  final response = await http.post(
    Uri.parse(hostName + "/register"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode({
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
    }),
  );


  if (response.statusCode == 201) {
    print(jsonDecode(response.body));
    final result = json.decode(response.body);
    if (result != null) {

      print(result['data']['token']);

      await saveIDApiKey(result['data']['token'].toString());
      await saveUserData(result['data']);


    }
    return SignUpModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return SignUpModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return SignUpModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to Sign Up');
  }
}


class SignUpPassword extends StatefulWidget {
  final first_name;
  final last_name;
  final email;

  const SignUpPassword({super.key, required this.first_name, required this.last_name, required this.email});

  @override
  State<SignUpPassword> createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends State<SignUpPassword> {
  final _formKey = GlobalKey<FormState>();

  var show_password = false;
  var terms_check = false;

  Future<SignUpModel>? _futureSignUp;


  String? password;
  String? password_confirmation;



  @override
  Widget build(BuildContext context) {
    return (_futureSignUp == null) ? buildColumn() : buildFutureBuilder();
  }

  buildColumn(){
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
                                    labelText: "Password",
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
                                  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#\$%^&*_()\-+=/.,<>?"~`£{}|:;])')
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
                                    password = value;
                                  });
                                },
                                textInputAction: TextInputAction.next,
                                obscureText: show_password ? false : true,
                                onSaved: (value) {
                                  setState(() {
                                    password = value;
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
                                    labelText: "Re-Enter Password",
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
                                  if (value != password) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    password_confirmation = value;
                                  });
                                },
                                textInputAction: TextInputAction.next,
                                obscureText: show_password ? false : true,
                                onSaved: (value) {
                                  setState(() {
                                    password_confirmation = value;
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

                                if(terms_check){
                                  print("###############");
                                  print(widget.first_name);
                                  print(widget.last_name);
                                  print(widget.email);
                                  print(password);
                                  print(password_confirmation);

                                  _futureSignUp = signUpUser(
                                      widget.first_name,
                                      widget.last_name,
                                      widget.email,
                                      password!,
                                      password_confirmation!
                                  );


                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Please agree to our Terms and Conditions",),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }


                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: happiPrimary,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Row(
                            children: [
                              InkWell(
                                  onTap: (){

                                    setState(() {
                                      terms_check = !terms_check;
                                    });

                                  },

                                  child: Icon(

                                    terms_check
                                        ? Icons.check_box
                                        :Icons.check_box_outline_blank ,

                                    color: happiGreen,)),
                              SizedBox(
                                width: 10,
                              ),
                              Text("I agree to the Terms & Conditions of this platform", style: TextStyle(fontSize: 13),),
                            ],
                          ),
                          SizedBox(
                            height: 150,
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignInScreen()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account? ", style: TextStyle(fontSize: 12),),
                                Text("Sign in here", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: happiPrimary),),
                              ],
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                )
              ],
            )));
  }


  FutureBuilder<SignUpModel> buildFutureBuilder() {
    return FutureBuilder<SignUpModel>(
        future: _futureSignUp,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);


            if(data.message == "Registration successful") {
              saveStatus("Register Complete");

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => VerifyEmail(token: data.data!.token!,)),
                );


                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "Registration Successful");
                    }
                );





              });

            }

            else if(data.message == "The email has already been taken."){
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                      (route) => false,
                );


                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return ErrorDialogBox(text: "The email has already been taken.");
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



  void dispose() {
    super.dispose();
  }


}
