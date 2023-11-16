import 'package:flutter/material.dart';
import 'package:happi_workers_pract/constants.dart';

class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({super.key});

  @override
  State<WelcomePage2> createState() => _WelcomePage2State();
}

class _WelcomePage2State extends State<WelcomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                      bottom: 40 ,
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
                        Image(
                            height: 80,
                            image: AssetImage("assets/images/happi_logo.png")),
                      ],
                    ),
                  ),
                  Expanded(child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => WelcomePage2()));

                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 1,
                                color: Colors.black.withOpacity(0.2)
                              )
                          ),
                          child: Center(
                            child: Text("I Already Have An Account", style: TextStyle(color: Colors.black),),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => WelcomePage2()));

                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: happiPrimary,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Text("It Is My First Time", style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ))

                ],
              ),
            )
          ],
        )
      )
    );
    
  }
}
