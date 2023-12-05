import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/photos/select_photo_options_screen.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/Profile/personal_info.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                              InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PersonalInfo()));

                              },
                                child: CircleAvatar(

                                  radius: 40,
                                  backgroundImage: AssetImage("assets/images/user.png"),
                                ),
                              )
                            ],
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
                          //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              SingleChildScrollView(
                                child: Container(

                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),

                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Notifications",
                                              style: TextStyle(
                                                  fontSize: 48,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),


                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(25),
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: Colors.white
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Text(
                                                  "Today",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w900,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(7),
                                                      decoration: BoxDecoration(
                                                        color: happiGreen.withOpacity(0.3),
                                                        borderRadius: BorderRadius.circular(5)
                                                      ),
                                                        child: Icon(Icons.notifications, color: happiGreen,)),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Practitioner Availability Alert",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w900,
                                                                color: Colors.black),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "Great news! A practitioner is available. Book a session now to connect with professional support and enhance your mental well-being.",
                                                            style: TextStyle(
                                                                fontSize: 15,),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),

                                          Container(
                                            padding: EdgeInsets.all(25),
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: Colors.white
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Text(
                                                  "Today",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w900,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(7),
                                                      decoration: BoxDecoration(
                                                        color: happiGreen.withOpacity(0.3),
                                                        borderRadius: BorderRadius.circular(5)
                                                      ),
                                                        child: Icon(Icons.notifications, color: happiGreen,)),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Practitioner Availability Alert",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w900,
                                                                color: Colors.black),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "Great news! A practitioner is available. Book a session now to connect with professional support and enhance your mental well-being.",
                                                            style: TextStyle(
                                                                fontSize: 15,),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),


                                      SizedBox(
                                        height: 10,
                                      ),


                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(25),
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Text(
                                                  "Today",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w900,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        padding: EdgeInsets.all(7),
                                                        decoration: BoxDecoration(
                                                            color: happiGreen.withOpacity(0.3),
                                                            borderRadius: BorderRadius.circular(5)
                                                        ),
                                                        child: Icon(Icons.notifications, color: happiGreen,)),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Practitioner Availability Alert",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w900,
                                                                color: Colors.black),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "Great news! A practitioner is available. Book a session now to connect with professional support and enhance your mental well-being.",
                                                            style: TextStyle(
                                                              fontSize: 15,),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),

                                          Container(
                                            padding: EdgeInsets.all(25),
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Text(
                                                  "Today",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w900,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        padding: EdgeInsets.all(7),
                                                        decoration: BoxDecoration(
                                                            color: happiGreen.withOpacity(0.3),
                                                            borderRadius: BorderRadius.circular(5)
                                                        ),
                                                        child: Icon(Icons.notifications, color: happiGreen,)),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "Practitioner Availability Alert",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w900,
                                                                color: Colors.black),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "Great news! A practitioner is available. Book a session now to connect with professional support and enhance your mental well-being.",
                                                            style: TextStyle(
                                                              fontSize: 15,),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )



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
