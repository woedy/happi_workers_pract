import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/Password/reset_password.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/models/verify_email_model.dart';
import 'package:happi_workers_pract/Authentication/SignUp/resend_email.dart';
import 'package:happi_workers_pract/Components/generic_error_dialog_box.dart';
import 'package:happi_workers_pract/Components/generic_loading_dialogbox.dart';
import 'package:happi_workers_pract/Components/generic_success_dialog_box.dart';
import 'package:happi_workers_pract/Onboarding/onboarding_1.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:http/http.dart' as http;


Future<VerifyEmailModel> resetPasswordToken(String email, String token) async {

  final response = await http.post(
    Uri.parse(hostName + "/auth/verify-reset-token"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    },
    body: jsonEncode({
      "email": email,
      "token": token,
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

    throw Exception('Failed to Reset token');
  }
}


class PasswordConfirm extends StatefulWidget {
  final email;
  const PasswordConfirm({super.key, required this.email});

  @override
  State<PasswordConfirm> createState() => _PasswordConfirmState();
}

class _PasswordConfirmState extends State<PasswordConfirm> {
  final _formKey = GlobalKey<FormState>();
  bool hasError = false;
  String token = "";
  TextEditingController controller = TextEditingController(text: "");


  Future<VerifyEmailModel>? _futureResetToken;


  @override
  Widget build(BuildContext context) {
    return (_futureResetToken == null) ? buildColumn() : buildFutureBuilder();
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
                    //crossAxisAlignment: CrossAxisAlignment.center,
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
                            "Password\nReset",
                            style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w400,
                                color: happiPrimary),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(

                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Enter the code sent below", style: TextStyle(color: Colors.white, fontSize: 15),),
                              ],
                            ),

                            SizedBox(
                              height:15,
                            ),

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
                                    token=text.toString();
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
                              height: 70,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {

                                  setState(() {
                                  _futureResetToken = resetPasswordToken(widget.email, token);

                                  });

                                  //verifyUserEmail(email_token, widget.token);
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



                            ],
                          )),


                    ],
                  ),
                )
              ],
            )));

  }



  FutureBuilder<VerifyEmailModel> buildFutureBuilder() {
    return FutureBuilder<VerifyEmailModel>(
        future: _futureResetToken,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);

            if(data.message == "Reset token verified successfully") {

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPassword(email: widget.email, token: token,)),
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "Reset token verified successfully");
                    }
                );





              });


            }

            else if (data.message == "This password reset token is invalid.") {
              WidgetsBinding.instance.addPostFrameCallback((_) {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PasswordConfirm(email: widget.email,))
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return ErrorDialogBox(text: 'This password reset token is invalid.',);
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
