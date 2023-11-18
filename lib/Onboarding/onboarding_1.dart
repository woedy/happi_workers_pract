import 'package:flutter/material.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_screen.dart';
import 'package:happi_workers_pract/constants.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
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
                      top: 0,
                      right: 0,
                      child: Image(
                          height: 280,
                          image: AssetImage("assets/images/conner.png"))),


                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              //color: Colors.red,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                    Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  height: 51,
                                  image: AssetImage("assets/images/happi_logo.png")),

                              SizedBox(
                                height: 50,
                              ),

                              Text("Hey Theresa", style: TextStyle(fontSize: 48),),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Begin your journey with Happiworkers here.", style: TextStyle(fontSize: 12, color: happiPrimary),),
                              SizedBox(
                                height: 15,
                              ),
                              Image(
                                  height: 51,
                                  image: AssetImage("assets/images/1) Avatar Group.png")),
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
                                    "Get Started",
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
                  ),


                ],
              ),
            )
          ],
        )
      )
    );
    
  }
}
