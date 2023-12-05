import 'package:flutter/material.dart';
import 'package:happi_workers_pract/constants.dart';

class ButtonDialogBox extends StatelessWidget {
  final Function()? onTapFunction;
  final String loadingText;


  const ButtonDialogBox({
    Key? key,
    required this.loadingText,
    this.onTapFunction,
  }) : super(key: key);


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
                loadingText,
                style: TextStyle(fontSize: 15),
              ),

              SizedBox(height: 30),

              InkWell(
                onTap: onTapFunction,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: happiPrimary,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text("Confirm", style: TextStyle(color: Colors.white),),
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
