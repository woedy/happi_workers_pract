import 'package:flutter/material.dart';
import 'package:happi_workers_pract/Home/home_screen.dart';
import 'package:happi_workers_pract/constants.dart';

class VerificationStatusDialogbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 322,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), // Border radius of 30
            color: Colors.white, // Blue color
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verification Status',
                style: TextStyle(fontSize: 20, color: happiPrimary),
              ),
              SizedBox(height: 30),
              Text(
                'Your documentation is being processed. We will review the submitted documents and contact you via email for additional verification. ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: (){
                  saveStatus("Registration Verification Complete");
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));

                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: happiPrimary,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text("Continue to dashboard", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
