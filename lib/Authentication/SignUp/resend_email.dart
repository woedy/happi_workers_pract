
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/Password/reset_password.dart';
import 'package:happi_workers_pract/Authentication/SignUp/models/verify_email_model.dart';
import 'package:happi_workers_pract/Authentication/SignUp/verify_email.dart';
import 'package:happi_workers_pract/Components/generic_error_dialog_box.dart';
import 'package:happi_workers_pract/Components/generic_loading_dialogbox.dart';
import 'package:happi_workers_pract/Components/generic_success_dialog_box.dart';
import 'package:happi_workers_pract/Onboarding/onboarding_1.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:http/http.dart' as http;


Future<VerifyEmailModel> resendVerifyUserEmail(String email_token, String token) async {

  final response = await http.post(
    Uri.parse(hostName + "/email/resend-verification-token"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    },
    body: jsonEncode({}),
  );


  if (response.statusCode == 201) {
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

    throw Exception('Failed to Resend Token');
  }
}


class ResendEmailVerification extends StatefulWidget {
  final token;
  const ResendEmailVerification({super.key, required this.token});

  @override
  State<ResendEmailVerification> createState() => _ResendEmailVerificationState();
}

class _ResendEmailVerificationState extends State<ResendEmailVerification> {
  final _formKey = GlobalKey<FormState>();
  bool hasError = false;
  String email_token = "";
  TextEditingController controller = TextEditingController(text: "");


  Future<VerifyEmailModel>? _futureResendVerifyEmail;


  @override
  Widget build(BuildContext context) {
    return (_futureResendVerifyEmail == null) ? buildColumn() : buildFutureBuilder();
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
                            "Resend\nVerify Email",
                            style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w400,
                                color: happiPrimary),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(

                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: Text("You are about to request for a new code to verify your email, still proceed?", style: TextStyle(color: happiDark, fontSize: 20),)),
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
                                    _futureResendVerifyEmail = resendVerifyUserEmail(email_token, widget.token);

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
                                      "Resend",
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
        future: _futureResendVerifyEmail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);

            if(data.message == "Email token resent successfully") {

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => VerifyEmail(token: widget.token)),
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "Email token resent successfully");
                    }
                );





              });


            }

            else if (data.message == "Invalid token") {
              WidgetsBinding.instance.addPostFrameCallback((_) {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ResendEmailVerification(token: widget.token,))
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
