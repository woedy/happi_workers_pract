import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_screen.dart';

import 'package:happi_workers_pract/Components/theme.dart';

import 'package:happi_workers_pract/Home/home_screen.dart';
import 'package:happi_workers_pract/Onboarding/my_availability.dart';
import 'package:happi_workers_pract/Onboarding/my_device_check.dart';
import 'package:happi_workers_pract/Onboarding/my_documents.dart';
import 'package:happi_workers_pract/Onboarding/onboarding_1.dart';
import 'package:happi_workers_pract/Onboarding/personal_Info.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/Onboarding/registration_verification.dart';

import 'package:happi_workers_pract/Welcome/welcome_page1.dart';
import 'package:happi_workers_pract/constants.dart';

import 'Authentication/SignIn/sign_in_screen.dart';
import 'Authentication/SignUp/verify_email.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => {runApp(MyApp())});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Hide the keyboard when tapping outside the text field
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Happiworkers Practitioner',
        theme: theme(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? api_key = "";
  String? status = "";
  Future? _user_api;
  Future? _status_f;

  @override
  void initState() {
    super.initState();
    _user_api = apiKey();
    _status_f = getStatus();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _user_api,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          print("######################################");
          print("######################################");
          print(status);

          if(api_key == null){
            return WelcomePage1();
          }else{
            if(status == "Register Complete"){
              return Onboarding1();
            }else if(status == "Personal Info Complete"){
              return PracticedDetails();
            }else if(status == "Practice Detail Complete"){
              return MyDocuments();
            }else if(status == "My Document Complete"){
              return MyAvailability();
            }else if(status == "My Availability Complete"){
              return MyDeviceCheck();
            }else if(status == "My Device Check Complete"){
              return RegistrationVerification();
            }else if(status == "Registration Verification Complete"){
              return HomeScreen();
            }else {
              return HomeScreen();
            }

          }

         // return api_key == null ? WelcomePage1() : HomeScreen();
         //return MyAvailability();

        });
  }

  Future apiKey() async {
    api_key = await getApiPref();
  }

  Future getStatus() async {
    status = await getRegStatus();
  }
}
