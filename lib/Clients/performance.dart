import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_availability.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/Profile/EditProfile/edit_personal_Info.dart';
import 'package:happi_workers_pract/Profile/overview.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Performance extends StatefulWidget {
  const Performance({super.key});

  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  String? selectedCertificate;


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
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Performance",
                                            style: TextStyle(
                                                fontSize: 48,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Complete a form",
                                        style: TextStyle(
                                            fontSize: 20,
                                           ),
                                      ),

                                      SizedBox(
                                        height: 50,
                                      ),

                                      Expanded(
                                        child: ListView(
                                          //scrollDirection: Axis.horizontal,
                                          children: [

                                            InkWell(
                                              onTap: (){
                                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProfileOverview()));

                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(30),
                                                decoration: BoxDecoration(
                                                    color: happiDark,
                                                    borderRadius: BorderRadius.circular(15)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(),
                                                    Text(
                                                      "Discharge end letter",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                    ),
                                                    Icon(Icons.arrow_forward_sharp, color: Colors.white,),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                              onTap: (){
                                                //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EditPersonalInfo()));

                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(30),
                                                decoration: BoxDecoration(
                                                    color: happiDark,
                                                    borderRadius: BorderRadius.circular(15)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(),
                                                    Text(
                                                      "Discharge letter to GP",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                    ),
                                                    Icon(Icons.arrow_forward_sharp, color: Colors.white,),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),

                                          ],
                                        ),
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



  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        //Navigator.of(context).pop();
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




  void _showCertificateSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Certificate'),
                onTap: () {
                  setState(() {
                    selectedCertificate = 'Certificate';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Accreditation'),
                onTap: () {
                  setState(() {
                    selectedCertificate = 'Accreditation';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('DBS Check'),
                onTap: () {
                  setState(() {
                    selectedCertificate = 'DBS Check';
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



}
