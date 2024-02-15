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

class MyDocumentsAnother extends StatefulWidget {
  const MyDocumentsAnother({super.key});

  @override
  State<MyDocumentsAnother> createState() => _MyDocumentsAnotherState();
}

class _MyDocumentsAnotherState extends State<MyDocumentsAnother> {
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
                                            "My\nDocuments",
                                            style: TextStyle(
                                                fontSize: 48,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 15,
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Upload Your Certificates", style: TextStyle(color: happiPrimary, fontSize: 12),),
                                          Text("Please upload all the certificates for the practice(s) you offer.", style: TextStyle(fontSize: 12),),
                                        ],
                                      ),


                                      SizedBox(
                                        height: 15,
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Certificate", style: TextStyle(fontSize: 12),),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(Icons.check_circle, color: Colors.black, size: 20,)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text("Accreditation", style: TextStyle(fontSize: 12),),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(Icons.check_circle, color: Colors.black, size: 20,)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text("DBS Check", style: TextStyle(fontSize: 12),),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(Icons.check_circle, color: Colors.black, size: 20,)
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      if (_image != null)
                                        Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Text(
                                                selectedCertificate.toString(),
                                                style: TextStyle(color: Colors.white, fontSize: 12),),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      Stack(
                                        children: [
                                          _image == null
                                              ? Container(
                                              height: 132,
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(15),
                                                  border:
                                                  Border.all(color: Colors.black.withOpacity(0.1)) ),
                                              child:  Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.file_present_outlined, size: 50, color: Colors.grey,),

                                                ],
                                              )
                                          )
                                              :Container(
                                            height: 132,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(

                                                    image: FileImage(_image!),
                                                    fit: BoxFit.cover
                                                ),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(15),
                                                border:
                                                Border.all(color: Colors.black.withOpacity(0.1)) ),

                                          ),
                                          if (_image != null)
                                            Positioned(
                                              bottom: 10,
                                              right: 10,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _image = null;
                                                  });
                                                },
                                                child: Icon(Icons.delete_forever, color: Colors.white,),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.red,
                                                  shape: CircleBorder(),
                                                  padding: EdgeInsets.all(8),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      if (_image != null)
                                        Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            border:
                                            Border.all(color: Colors.black.withOpacity(0.1))),
                                        child: GestureDetector(
                                          onTap: () {
                                            _showCertificateSelectionModal(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),

                                            height: 60,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.white.withOpacity(0.1))
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  selectedCertificate ?? 'Certificate type',
                                                  style: TextStyle(fontSize: 13,
                                                      color: Colors.black.withOpacity(0.5)),
                                                ),
                                                Icon(Icons.arrow_drop_down, size: 30, color: Colors.black,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),


                                      SizedBox(
                                        height: 20,
                                      ),


                                        InkWell(
                                          onTap: () {
                                            _pickImage(ImageSource.camera);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Take a picture",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      InkWell(
                                        onTap: () {
                                          _pickImage(ImageSource.gallery);

                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              color: happiPrimary,
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Upload Document",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                         Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyAvailability()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Skip",
                                              style: TextStyle(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
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
