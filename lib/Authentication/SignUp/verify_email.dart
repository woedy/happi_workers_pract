import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/Password/password_screen.dart';
import 'package:happi_workers_pract/Authentication/SignIn/models/sign_in_model.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/models/sign_up_model.dart';
import 'package:happi_workers_pract/Authentication/SignUp/models/verify_email_model.dart';
import 'package:happi_workers_pract/Authentication/SignUp/resend_email.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/generic_error_dialog_box.dart';
import 'package:happi_workers_pract/Components/generic_loading_dialogbox.dart';
import 'package:happi_workers_pract/Components/generic_success_dialog_box.dart';
import 'package:happi_workers_pract/Components/keyboard_utils.dart';
import 'package:happi_workers_pract/Home/home_screen.dart';
import 'package:happi_workers_pract/Onboarding/onboarding_1.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<VerifyEmailModel> verifyUserEmail(String email_token, String token) async {

  final response = await http.post(
    Uri.parse(hostName + "/email/verify-token"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    },
    body: jsonEncode({
      "token": email_token,
    }),
  );


  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    final result = json.decode(response.body);
    if (result != null) {

      print("#######################");
      print(result);


    }
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }  else if (response.statusCode == 403) {
    print(jsonDecode(response.body));
    return VerifyEmailModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to Verify User');
  }
}

class VerifyEmail extends StatefulWidget {
  final token;
  const VerifyEmail({super.key, required this.token});


  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final _formKey = GlobalKey<FormState>();
  bool hasError = false;
  String email_token = "";
  TextEditingController controller = TextEditingController(text: "");


  Future<VerifyEmailModel>? _futureVerifyEmail;


  @override
  Widget build(BuildContext context) {
    return (_futureVerifyEmail == null) ? buildColumn() : buildFutureBuilder();
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
                            "Verify Email",
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PinCodeTextField(
                                  autofocus: true,
                                  controller: controller,
                                  hideCharacter: false,
                                  highlight: true,
                                  highlightColor: happiGreen,
                                  defaultBorderColor:
                                  Colors.grey.withOpacity(0.3),
                                  hasTextBorderColor:
                                  Colors.grey.withOpacity(0.2),
                                  highlightPinBoxColor: Colors.white.withOpacity(0.3),
                                  pinBoxColor: Colors.white.withOpacity(0.3),
                                  pinBoxRadius: 10,
                                  keyboardType: TextInputType.text,
                                  maxLength: 6,
                                  //maskCharacter: "😎",
                                  onTextChanged: (text) {
                                    setState(() {
                                      hasError = false;
                                    });
                                  },
                                  onDone: (text) {
                                    print("DONE $text");
                                    print("DONE CONTROLLER ${controller.text}");
                                    email_token=text.toString();
                                  },
                                  pinBoxWidth: 50,
                                  pinBoxHeight: 80,
                                  //hasUnderline: true,
                                  wrapAlignment: WrapAlignment.spaceAround,
                                  pinBoxDecoration: ProvidedPinBoxDecoration
                                      .defaultPinBoxDecoration,
                                  pinTextStyle: TextStyle(fontSize: 35.0),
                                  pinTextAnimatedSwitcherTransition:
                                  ProvidedPinBoxTextAnimation
                                      .scalingTransition,
                                  pinTextAnimatedSwitcherDuration:
                                  Duration(milliseconds: 300),
                                  highlightAnimationBeginColor: Colors.black,
                                  highlightAnimationEndColor: Colors.white12,
                                )
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

                              setState(() {
                                _futureVerifyEmail = verifyUserEmail(email_token, widget.token);

                              });

                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: happiPrimary,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  "Confirm Code",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          InkWell(
                              onTap: () {

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ResendEmailVerification(token: widget.token,))
                                );
                              },
                              child: Text("Resend Verification", style: TextStyle(color: happiPrimary, fontSize: 17, fontWeight: FontWeight.bold),)),

                        ],
                      )
                    ],
                  ),
                )
              ],
            )));
  }

  FutureBuilder<VerifyEmailModel> buildFutureBuilder() {
    return FutureBuilder<VerifyEmailModel>(
        future: _futureVerifyEmail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);

            if(data.message == "Email verified successfully") {

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "Verification Successful");
                    }
                );
                Future.delayed(Duration(milliseconds: 500), () {
                  // Pop the dialog
                  //Navigator.of(context).pop();

                  // Navigate to the dashboard
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Onboarding1()),
                  );
                });




              });


            }

            else if (data.message == "Invalid token") {
              WidgetsBinding.instance.addPostFrameCallback((_) {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => VerifyEmail(token: widget.token,))
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return ErrorDialogBox(text: 'Invalid token',);
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
