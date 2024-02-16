import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/generic_loading_dialogbox.dart';
import 'package:happi_workers_pract/Components/generic_success_dialog_box.dart';
import 'package:happi_workers_pract/Onboarding/models/my_document_model.dart';
import 'package:happi_workers_pract/Onboarding/my_availability.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


Future<MyDocumentModel> update_document(data) async {
  try {
    print("############");
    print("FUNCTION CALL");

    print(data);

    final url = Uri.parse(hostName + "/profile/documents");
    final request = http.MultipartRequest('POST', url);

    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ' + "10|Hw6CCoRmcETHdgp6uuitvFvkmjzx21aS0JEJEwaJe88e3b00";

    request.files.add(await http.MultipartFile.fromPath('document', data["document"]));

    request.fields['type'] = data["type"];

    print("############");
    print("SENDINGGG");

    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = await response.stream.bytesToString();
      final result = json.decode(responseBody);

      print("############");
      print("WE ARE INNNNNNNN");
      print(result);

      if (result["data"] != null && result["data"].length > 0) {
        return MyDocumentModel.fromJson(result);
      } else {
        // Return a default UserProfileModel if data is empty
        return MyDocumentModel();
      }
    } else if (response.statusCode == 422 ||
        response.statusCode == 403 ||
        response.statusCode == 400 ||
        response.statusCode == 500) {
      final responseBody = await response.stream.bytesToString();
      final result = json.decode(responseBody);

      print("############");
      print("ERRORRRRRR");
      print(result);

      return MyDocumentModel.fromJson(result);
    } else {
      print("############");
      print("Failed to add data. Status code: ${response.statusCode}");
      throw Exception('Failed to add data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to add data. Error: $e');
  }
}

class MyDocuments extends StatefulWidget {
  const MyDocuments({super.key});

  @override
  State<MyDocuments> createState() => _MyDocumentsState();
}

class _MyDocumentsState extends State<MyDocuments> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
  File? _file;
  File? _document;
  String? selectedCertificate;
  String? status;


  Future<MyDocumentModel>? _futureUpdateDocument;


  @override
  Widget build(BuildContext context) {
    return (_futureUpdateDocument == null) ? buildColumn() : buildFutureBuilder();
  }


  buildColumn(){
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
                                          // Other widgets...
                                          if (_image != null)...[
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 132,
                                                  width: MediaQuery.of(context).size.width,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: FileImage(_image!),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15),
                                                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _image = null;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.black.withOpacity(0.5),
                                                      ),
                                                      child: Icon(Icons.delete, color: Colors.red),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]else  if (_file != null)...[
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 132,
                                                  width: MediaQuery.of(context).size.width,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15),
                                                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                                                  ),
                                                  child: Center(
                                                    child: Icon(Icons.insert_drive_file, size: 50, color: Colors.green),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _file = null;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.black.withOpacity(0.5),
                                                      ),
                                                      child: Icon(Icons.delete, color: Colors.red),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]else... [
                                            Container(
                                              height: 132,
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(15),
                                                border: Border.all(color: Colors.black.withOpacity(0.1)),
                                              ),
                                              child: Center(
                                                child: Icon(Icons.photo_camera, size: 50, color: Colors.grey),
                                              ),
                                            ),
                                          ]
                                          // Other widgets...
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



                                      if (_image != null || _file != null)...[

                                        InkWell(
                                          onTap: () {

                                            if(selectedCertificate != null) {
                                              // Make post request before navigation


                                              if (_image == null) {
                                                _document = _file;
                                              } else {
                                                _document = _image;
                                              }

                                              print(_document);

                                              var data = {
                                                "document": _document!.path,
                                                "type": selectedCertificate
                                              };


                                              setState(() {
                                                status = "Another";
                                                _futureUpdateDocument = update_document(data);

                                              });




                                            }else{
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("Please select file type.",),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Upload another",
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
                                            // Make post request before navigation
                                            if(selectedCertificate != null) {
                                              if(_image == null){
                                                _document = _file;
                                              }else{
                                                _document = _image;
                                              }

                                              print(_document);
                                              var data = {
                                                "document": _document!.path,
                                                "type": selectedCertificate
                                              };


                                              setState(() {
                                                status = "Continue";
                                                _futureUpdateDocument = update_document(data);

                                              });




                                            }else{
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("Please select file type.",),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: happiPrimary,
                                                borderRadius: BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Save & Continue",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),



                                      ]else...[
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
                                            _pickFile();

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
                                      ],

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

  FutureBuilder<MyDocumentModel> buildFutureBuilder() {
    return FutureBuilder<MyDocumentModel>(
        future: _futureUpdateDocument,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            print("#########################");
            print("#########################");
            print(data.data);

            if(data.data != null){
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "Document Updated.");
                    }
                );
                Future.delayed(Duration(milliseconds: 500), () {
                  // Pop the dialog
                  //Navigator.of(context).pop();

                  // Navigate to the dashboard

                  if(status == "Continue"){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyAvailability()),
                    );
                  }else if(status == "Another"){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyDocuments()),
                    );
                  }

                });




              });
            }


          }

          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please Wait...")
                ],
              ),
            ),
          );


        }
    );
  }




/*

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
  }*/


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
                    selectedCertificate = 'certificate';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Accreditation'),
                onTap: () {
                  setState(() {
                    selectedCertificate = 'accreditation';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('DBS Check'),
                onTap: () {
                  setState(() {
                    selectedCertificate = 'dbs';
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

  // Modify _pickImage method
  Future<void> _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        _file = null; // Reset _file when an image is selected
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }


  // Modify _pickFile method
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      print('File picked: ${file.name}');
      setState(() {
        _file = File(file.path!);
        _image = null; // Reset _image when a file is selected
      });
      // Use the picked file for upload or other operations
    } else {
      // User canceled the picker
      print('No file picked');
    }
  }

}
