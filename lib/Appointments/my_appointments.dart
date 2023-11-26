import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_availability.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({super.key});

  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
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
                                            "Your\nAppointments",
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

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text("Up coming", style: TextStyle(color: happiPrimary, fontSize: 16),),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                height: 2,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    color: happiPrimary
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Previous", style: TextStyle(color: happiPrimary, fontSize: 16),),

                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),


                                      Expanded(
                                        child: ListView(
                                          //scrollDirection: Axis.horizontal,
                                          children: [
                                            Container(
                                              height: 209,
                                              width: 335,
                                              decoration: BoxDecoration(
                                                color: happiDark,
                                                borderRadius: BorderRadius.circular(20),

                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,

                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                          children: [
                                                            Row(
                                                              children: [

                                                                CircleAvatar(

                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text("Julia Reddington", style: TextStyle(color: Colors.white, fontSize: 12),),
                                                              ],
                                                            ),
                                                            Icon(Icons.info_outline, color: Colors.white,)
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text("9/23/16 at 10Am", style: TextStyle(color: happiGreen, fontWeight: FontWeight.w900, fontSize: 15),),
                                                        Text("curtis.weaver@example.com", style: TextStyle(color: Colors.white, fontSize: 12),),

                                                        SizedBox(
                                                          height: 40,
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [


                                                      Row(
                                                        children: [
                                                          Container(
                                                              padding: EdgeInsets.all(15),
                                                              width: 120,
                                                              decoration: BoxDecoration(
                                                                color: happiGreen,
                                                                borderRadius: BorderRadius.circular(20),

                                                              ),

                                                              child: Center(child: Text("Join", style: TextStyle(color: Colors.black, fontSize: 10),))),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                              padding: EdgeInsets.all(15),
                                                              width: 120,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(20),

                                                              ),

                                                              child: Center(child: Text("Cancel", style: TextStyle(color: Colors.black, fontSize: 10),))),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                        ],
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
                                              height: 209,
                                              width: 335,
                                              decoration: BoxDecoration(
                                                color: happiDark,
                                                borderRadius: BorderRadius.circular(20),

                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,

                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                          children: [
                                                            Row(
                                                              children: [

                                                                CircleAvatar(

                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text("Julia Reddington", style: TextStyle(color: Colors.white, fontSize: 12),),
                                                              ],
                                                            ),
                                                            Icon(Icons.info_outline, color: Colors.white,)
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text("9/23/16 at 10Am", style: TextStyle(color: happiGreen, fontWeight: FontWeight.w900, fontSize: 15),),
                                                        Text("curtis.weaver@example.com", style: TextStyle(color: Colors.white, fontSize: 12),),

                                                        SizedBox(
                                                          height: 40,
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [


                                                      Row(
                                                        children: [
                                                          Container(
                                                              padding: EdgeInsets.all(15),
                                                              width: 120,
                                                              decoration: BoxDecoration(
                                                                color: happiGreen,
                                                                borderRadius: BorderRadius.circular(20),

                                                              ),

                                                              child: Center(child: Text("Join", style: TextStyle(color: Colors.black, fontSize: 10),))),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                              padding: EdgeInsets.all(15),
                                                              width: 120,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(20),

                                                              ),

                                                              child: Center(child: Text("Cancel", style: TextStyle(color: Colors.black, fontSize: 10),))),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                        ],
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
                                              height: 209,
                                              width: 335,
                                              decoration: BoxDecoration(
                                                color: happiDark,
                                                borderRadius: BorderRadius.circular(20),

                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal:15.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,

                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                          children: [
                                                            Row(
                                                              children: [

                                                                CircleAvatar(

                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text("Julia Reddington", style: TextStyle(color: Colors.white, fontSize: 12),),
                                                              ],
                                                            ),
                                                            Icon(Icons.info_outline, color: Colors.white,)
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text("9/23/16 at 10Am", style: TextStyle(color: happiGreen, fontWeight: FontWeight.w900, fontSize: 15),),
                                                        Text("curtis.weaver@example.com", style: TextStyle(color: Colors.white, fontSize: 12),),

                                                        SizedBox(
                                                          height: 40,
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [


                                                      Row(
                                                        children: [
                                                          Container(
                                                              padding: EdgeInsets.all(15),
                                                              width: 120,
                                                              decoration: BoxDecoration(
                                                                color: happiGreen,
                                                                borderRadius: BorderRadius.circular(20),

                                                              ),

                                                              child: Center(child: Text("Join", style: TextStyle(color: Colors.black, fontSize: 10),))),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                              padding: EdgeInsets.all(15),
                                                              width: 120,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(20),

                                                              ),

                                                              child: Center(child: Text("Cancel", style: TextStyle(color: Colors.black, fontSize: 10),))),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
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
