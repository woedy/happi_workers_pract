import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Container(
          padding: EdgeInsets.all(0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            //color: Colors.red,

            image: DecorationImage(
              image: AssetImage("assets/images/Get Started.png"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              Image(
                height: 80,
                  image: AssetImage("assets/images/happi_logo.png")),
              Container(
                child: Center(
                  child: Text("I Already Have An Account",),
                ),
              )
            ],
          ),

        ),
      )
    );
  }
}
