import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/photos/select_photo_options_screen.dart';
import 'package:happi_workers_pract/Onboarding/my_device_check.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RecurringAvailability extends StatefulWidget {
  const RecurringAvailability({super.key});

  @override
  State<RecurringAvailability> createState() => _RecurringAvailabilityState();
}

class _RecurringAvailabilityState extends State<RecurringAvailability> {
  final _formKey = GlobalKey<FormState>();

  String? selectedGender;
  File? _image;


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
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                    image: AssetImage("assets/images/Back_b.png")),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Back", style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                        ],
                      ),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          //color: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              SingleChildScrollView(
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Set To\nRecurring",
                                            style: TextStyle(
                                                fontSize: 48,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),



                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text("Start date", style: TextStyle(fontSize: 12, color: Colors.black),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(15),
                                                  border:
                                                  Border.all(color: Colors.black.withOpacity(0.1))),
                                              child: DateTimeFormField(
                                                decoration: const InputDecoration(
                                                  hintStyle: TextStyle(color: Colors.white),
                                                  errorStyle: TextStyle(color: Colors.redAccent),
                                                  border: InputBorder.none,
                                                  suffixIcon: Icon(Icons.event_note, color: Colors.black),
                                                  labelText: 'Select start date',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                ),
                                                mode: DateTimeFieldPickerMode.date,
                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                                validator: (e) {
                                                  if (e == null) {
                                                    return 'Date of birth required';
                                                  }

                                                  /* bool isValid = isDateBeforeToday(e.toString());

        if (isValid) {

        } else {
          return "The dob field must be a date before today.";
        }*/

                                                  return null;
                                                },
                                                onDateSelected: (DateTime value) {},
                                                onSaved: (value) {
                                                  setState(() {

                                                  });
                                                },
                                                dateFormat: DateFormat("dd/MM/yy"), // Specify the desired date format (month/year)
                                              ),
                                            ),

                                            SizedBox(
                                              height: 20,
                                            ),


                                            Text("End date", style: TextStyle(fontSize: 12, color: Colors.black),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(15),
                                                  border:
                                                  Border.all(color: Colors.black.withOpacity(0.1))),
                                              child: DateTimeFormField(
                                                decoration: const InputDecoration(
                                                  hintStyle: TextStyle(color: Colors.white),
                                                  errorStyle: TextStyle(color: Colors.redAccent),
                                                  border: InputBorder.none,
                                                  suffixIcon: Icon(Icons.event_note, color: Colors.black),
                                                  labelText: 'Select end date',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                ),
                                                mode: DateTimeFieldPickerMode.date,
                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                                validator: (e) {
                                                  if (e == null) {
                                                    return 'Date of birth required';
                                                  }

                                                  /* bool isValid = isDateBeforeToday(e.toString());

        if (isValid) {

        } else {
          return "The dob field must be a date before today.";
        }*/

                                                  return null;
                                                },
                                                onDateSelected: (DateTime value) {},
                                                onSaved: (value) {
                                                  setState(() {

                                                  });
                                                },
                                                dateFormat: DateFormat("dd/MM/yy"), // Specify the desired date format (month/year)
                                              ),
                                            ),



                                            SizedBox(
                                              height: 20,
                                            ),


                                            Text("Start time", style: TextStyle(fontSize: 12, color: Colors.black),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(15),
                                                  border:
                                                  Border.all(color: Colors.black.withOpacity(0.1))),
                                              child: DateTimeFormField(
                                                decoration: const InputDecoration(
                                                  hintStyle: TextStyle(color: Colors.white),
                                                  errorStyle: TextStyle(color: Colors.redAccent),
                                                  border: InputBorder.none,
                                                  suffixIcon: Icon(Icons.access_time_sharp, color: Colors.black),
                                                  labelText: 'Select start time',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                ),
                                                mode: DateTimeFieldPickerMode.time,
                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                                validator: (e) {
                                                  if (e == null) {
                                                    return 'Date of birth required';
                                                  }

                                                  /* bool isValid = isDateBeforeToday(e.toString());

        if (isValid) {

        } else {
          return "The dob field must be a date before today.";
        }*/

                                                  return null;
                                                },
                                                onDateSelected: (DateTime value) {},
                                                onSaved: (value) {
                                                  setState(() {

                                                  });
                                                },
                                                //dateFormat: DateFormat("dd/MM/yy"), // Specify the desired date format (month/year)
                                              ),
                                            ),


                                            SizedBox(
                                              height: 20,
                                            ),


                                            Text("End time", style: TextStyle(fontSize: 12, color: Colors.black),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(15),
                                                  border:
                                                  Border.all(color: Colors.black.withOpacity(0.1))),
                                              child: DateTimeFormField(
                                                decoration: const InputDecoration(
                                                  hintStyle: TextStyle(color: Colors.white),
                                                  errorStyle: TextStyle(color: Colors.redAccent),
                                                  border: InputBorder.none,
                                                  suffixIcon: Icon(Icons.access_time_sharp, color: Colors.black),
                                                  labelText: 'Select end time',
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                ),
                                                mode: DateTimeFieldPickerMode.time,
                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                                validator: (e) {
                                                  if (e == null) {
                                                    return 'Date of birth required';
                                                  }

                                                  /* bool isValid = isDateBeforeToday(e.toString());

        if (isValid) {

        } else {
          return "The dob field must be a date before today.";
        }*/

                                                  return null;
                                                },
                                                onDateSelected: (DateTime value) {},
                                                onSaved: (value) {
                                                  setState(() {

                                                  });
                                                },
                                                //dateFormat: DateFormat("dd/MM/yy"), // Specify the desired date format (month/year)
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),


                                      SizedBox(
                                        height: 20,
                                      ),

                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyDeviceCheck()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: happiPrimary,
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Continue",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }


  void _showGenderSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Male'),
                onTap: () {
                  setState(() {
                    selectedGender = 'Male';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Female'),
                onTap: () {
                  setState(() {
                    selectedGender = 'Female';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }



  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }


  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }




}
