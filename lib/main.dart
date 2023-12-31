import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Appointments/my_appointments.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_screen.dart';
import 'package:happi_workers_pract/Clients/client_overview.dart';
import 'package:happi_workers_pract/Clients/meet_your_clients.dart';
import 'package:happi_workers_pract/Clients/new_note.dart';
import 'package:happi_workers_pract/Clients/online_assessment.dart';
import 'package:happi_workers_pract/Clients/online_assessment2.dart';
import 'package:happi_workers_pract/Clients/performance_details.dart';
import 'package:happi_workers_pract/Clients/performance_overview.dart';
import 'package:happi_workers_pract/Clients/progress_note_details.dart';
import 'package:happi_workers_pract/Clients/progress_notes.dart';
import 'package:happi_workers_pract/Clients/treatment_overview.dart';
import 'package:happi_workers_pract/Clients/your_clinical_assessment.dart';
import 'package:happi_workers_pract/Components/theme.dart';
import 'package:happi_workers_pract/Earnings/earnings_overview.dart';
import 'package:happi_workers_pract/Earnings/earnings_overview_details.dart';
import 'package:happi_workers_pract/Earnings/earnings_screen.dart';
import 'package:happi_workers_pract/Home/home_screen.dart';
import 'package:happi_workers_pract/Messages/my_chat_screen.dart';
import 'package:happi_workers_pract/Profile/personal_info.dart';
import 'package:happi_workers_pract/Settings/faqs_screen.dart';
import 'package:happi_workers_pract/Settings/settings_screen.dart';
import 'package:happi_workers_pract/SplashScreen/splash_screen.dart';
import 'package:happi_workers_pract/Welcome/welcome_page2.dart';
import 'package:happi_workers_pract/Welcome/welcome_page1.dart';
import 'package:happi_workers_pract/constants.dart';

import 'Clients/performance.dart';
import 'Onboarding/onboarding_1.dart';


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
        title: 'Happiworkers',
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
  Future? _user_api;

  @override
  void initState() {
    super.initState();
    _user_api = apiKey();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _user_api,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          //return api_key == null ? SplashScreen() : HomeScreen();
          return PerformanceOverview();
          return Onboarding1();

        });
  }

  Future apiKey() async {
    api_key = await getApiPref();
  }
}
