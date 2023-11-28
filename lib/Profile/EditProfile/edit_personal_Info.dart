import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/photos/select_photo_options_screen.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({super.key});

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
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

                                      SizedBox(
                                        height: 20,
                                      ),

                                      CircleAvatar(
                                        radius: 60,
                                      ),


                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Profile Picture",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: happiPrimary),
                                      ),

                                      SizedBox(
                                        height: 20,
                                      ),
                                      Expanded(
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15),
                                                    border:
                                                    Border.all(color: Colors.black.withOpacity(0.1))),
                                                child: TextFormField(
                                                  style: TextStyle(color: Colors.black),
                                                  decoration: InputDecoration(
                                                    //hintText: 'Enter Username/Email',

                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.normal),
                                                    labelText: "Bio",
                                                    labelStyle: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black.withOpacity(0.5)),
                                                    enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white)),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white)),
                                                    border: InputBorder.none,
                                                  ),
                                                  maxLines: 4,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(225),
                                                    PasteTextInputFormatter(),
                                                  ],
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Contact name is required';
                                                    }
                                                    if (value.length < 3) {
                                                      return 'Contact too short';
                                                    }
                                                  },
                                                  textInputAction: TextInputAction.next,
                                                  autofocus: false,
                                                  onSaved: (value) {
                                                    setState(() {
                                                      //email = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15),
                                                    border:
                                                    Border.all(color: Colors.black.withOpacity(0.1))),
                                                child: TextFormField(
                                                  style: TextStyle(color: Colors.black),
                                                  decoration: InputDecoration(
                                                    //hintText: 'Enter Username/Email',

                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.normal),
                                                    labelText: "Specialties (Max 8 Tags)",
                                                    labelStyle: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black.withOpacity(0.5)),
                                                    enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white)),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white)),
                                                    border: InputBorder.none,
                                                  ),
                                                  maxLines: 4,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(225),
                                                    PasteTextInputFormatter(),
                                                  ],
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Contact name is required';
                                                    }
                                                    if (value.length < 3) {
                                                      return 'Contact too short';
                                                    }
                                                  },
                                                  textInputAction: TextInputAction.next,
                                                  autofocus: false,
                                                  onSaved: (value) {
                                                    setState(() {
                                                      //email = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15),
                                                    border:
                                                    Border.all(color: Colors.black.withOpacity(0.1))),
                                                child: TextFormField(
                                                  style: TextStyle(color: Colors.black),
                                                  decoration: InputDecoration(
                                                    //hintText: 'Enter Username/Email',

                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.normal),
                                                    labelText: "Also experienced in (Max 20 Tags)",
                                                    labelStyle: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black.withOpacity(0.5)),
                                                    enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white)),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.white)),
                                                    border: InputBorder.none,
                                                  ),
                                                  maxLines: 4,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(225),
                                                    PasteTextInputFormatter(),
                                                  ],
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Contact name is required';
                                                    }
                                                    if (value.length < 3) {
                                                      return 'Contact too short';
                                                    }
                                                  },
                                                  textInputAction: TextInputAction.next,
                                                  autofocus: false,
                                                  onSaved: (value) {
                                                    setState(() {
                                                      //email = value;
                                                    });
                                                  },
                                                ),
                                              ),


                                              SizedBox(
                                                height: 10,

                                              ),


                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Service Offered",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600,
                                                          color: happiPrimary),
                                                    ),
                                                    SizedBox(
                                                      height: 10,

                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons.check_box_outline_blank),
                                                            Text(
                                                              "Phone",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: happiDark),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(Icons.check_box_outline_blank),
                                                            Text(
                                                              "Video",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: happiDark),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(Icons.check_box_outline_blank),
                                                            Text(
                                                              "Text",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: happiDark),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),

                                                    SizedBox(
                                                      height: 20,

                                                    ),

                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PracticedDetails()));
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
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
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
