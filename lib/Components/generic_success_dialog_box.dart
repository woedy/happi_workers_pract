import 'package:flutter/material.dart';
import 'package:happi_workers_pract/constants.dart';

class SuccessDialogBox extends StatelessWidget {
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
             Icon(Icons.check_circle, color: happiGreen, size: 50,),
              SizedBox(height: 30), // Spacer
              Text(
                'Loading, please wait...',
                style: TextStyle(fontSize: 15),
              ), // Text
            ],
          ),
        ),
      ),
    );
  }
}
