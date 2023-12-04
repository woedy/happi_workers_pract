import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/Password/reset_password.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PasswordConfirm extends StatefulWidget {
  const PasswordConfirm({super.key});

  @override
  State<PasswordConfirm> createState() => _PasswordConfirmState();
}

class _PasswordConfirmState extends State<PasswordConfirm> {
  final _formKey = GlobalKey<FormState>();
  bool hasError = false;
  String email_token = "";
  TextEditingController controller = TextEditingController(text: "");


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
                                  maxLength: 4,
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
                                  pinBoxWidth: 80,
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
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ResetPassword()));
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
                          ))
                    ],
                  ),
                )
              ],
            )));
  }
}
