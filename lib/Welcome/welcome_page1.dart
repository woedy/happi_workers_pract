import 'package:flutter/material.dart';
import 'package:happi_workers_pract/constants.dart';

class WelcomePage1 extends StatefulWidget {
  const WelcomePage1({super.key});

  @override
  State<WelcomePage1> createState() => _WelcomePage1State();
}

class _WelcomePage1State extends State<WelcomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        top: false,

        child: Container(
          padding: EdgeInsets.all(0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: happiDark,

          child: Stack(
            children: [
              Column(
                children: [
                  Image(image: AssetImage("assets/images/Frame 5.png"))
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.5),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Image(
                          height: 51,
                            image: AssetImage("assets/images/Happiworkers Full color1@4x 2.png")),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Personalized\ncare for\neverybody", style: TextStyle(fontSize: 48, fontWeight: FontWeight.w300, color: Colors.white),),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          Text("Millions of people have engaged with our\nplatform with our platform for therapy,\nmedication, assessment, healthy living support,\nand self-help tools.", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 10,
                            width: 126,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(
                              child: Text("Get Started", style: TextStyle(fontFamily: 'Montserrat',),),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

        ),
      )
    );
  }
}
