import 'package:flutter/material.dart';
import 'package:happi_workers_pract/Messages/my_chat_screen.dart';
import 'package:happi_workers_pract/Onboarding/my_availability.dart';
import 'package:happi_workers_pract/Profile/overview.dart';
import 'package:happi_workers_pract/Profile/personal_info.dart';
import 'package:happi_workers_pract/constants.dart';

class AddButtonDialogBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), // Border radius of 30
            color: happiDark, // Blue color
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyChatScreen()));

                },
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  SizedBox(),
                      Text(
                        "Message a client",
                        style: TextStyle(
                            fontSize: 15,
                        ),
                      ),
                      Icon(Icons.arrow_forward_sharp, ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PersonalInfo()));

                },
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  SizedBox(),
                      Text(
                        "View my profile",
                        style: TextStyle(
                            fontSize: 15,
                        ),
                      ),
                      Icon(Icons.arrow_forward_sharp, ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyAvailability()));

                },
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Text(
                        "Check my availability",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Icon(Icons.arrow_forward_sharp, ),
                    ],
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
