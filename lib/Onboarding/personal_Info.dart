import 'dart:convert';
import 'dart:io';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/generic_loading_dialogbox.dart';
import 'package:happi_workers_pract/Components/generic_success_dialog_box.dart';
import 'package:happi_workers_pract/Components/keyboard_utils.dart';
import 'package:happi_workers_pract/Components/photos/select_photo_options_screen.dart';
import 'package:happi_workers_pract/Onboarding/models/user_profile_models.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/*
Future<UserProfileModel> update_personal_info(data) async {

  print("############");
  print("FUNCTION CALL");
  final url = Uri.parse(hostName + "/profile/personal-information");
  final request = http.MultipartRequest('POST', url);

  request.headers['Accept'] = 'application/json';
  //request.headers['Content-Type'] = 'multipart/form-data';
  request.headers['Authorization'] = 'Bearer ' + '10|Hw6CCoRmcETHdgp6uuitvFvkmjzx21aS0JEJEwaJe88e3b00';

  request.files.add(await http.MultipartFile.fromPath('avatar', data["avatar"]));
  request.files.add(await http.MultipartFile.fromPath('id_card', data["avatar"]));

  request.fields['gender'] = data["gender"];
  request.fields['academic_title'] = data["academic_title"];
  request.fields['first_name'] = data["first_name"];
  request.fields['last_name'] = data["last_name"];
  request.fields['dob'] = data["dob"];
  request.fields['contact_number'] = data["contact_number"];
  request.fields['id_type'] = "None";
  request.fields['address_line_1'] = "None";
  request.fields['address_line2'] = "None";
  request.fields['city'] = "None";
  request.fields['postcode'] = "None";
  request.fields['country'] = "None";

  try {
    print("############");
    print("SENDINGGG");
    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = await response.stream.bytesToString();
      final result = json.decode(responseBody);


      print("############");
      print("WE ARE INNNNNNNN");
      print(result);

      return UserProfileModel.fromJson(result);

    } else if (response.statusCode == 422 ||
        response.statusCode == 403 ||
        response.statusCode == 400) {
      final responseBody = await response.stream.bytesToString();
      final result = json.decode(responseBody);


      print("############");
      print("ERRORRRRRR");
      print(result);

      return UserProfileModel.fromJson(result);
    } else {
      throw Exception('Failed to add data');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to add data');
  }
}
*/


Future<UserProfileModel> update_personal_info(data) async {
  try {
    print("############");
    print("FUNCTION CALL");

    print(data);

    final url = Uri.parse(hostName + "/profile/personal-information");
    final request = http.MultipartRequest('POST', url);

    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ' + data["token"].toString();

    request.files.add(await http.MultipartFile.fromPath('avatar', data["avatar"]));
    request.files.add(await http.MultipartFile.fromPath('id_card', data["avatar"]));

    request.fields['gender'] = data["gender"];
    request.fields['academic_title'] = data["academic_title"];
    request.fields['first_name'] = data["first_name"];
    request.fields['last_name'] = data["last_name"];
    request.fields['dob'] = data["dob"];
    request.fields['contact_number'] = data["contact_number"];
    request.fields['id_type'] = "None";
    request.fields['address_line_1'] = "None";
    request.fields['address_line_2'] = "None";
    request.fields['city'] = "None";
    request.fields['postcode'] = "None";
    request.fields['country'] = "None";

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
        return UserProfileModel.fromJson(result["data"][0]);
      } else {
        // Return a default UserProfileModel if data is empty
        return UserProfileModel();
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

      return UserProfileModel.fromJson(result);
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


class MyPersonalInfo extends StatefulWidget {
  const MyPersonalInfo({super.key});

  @override
  State<MyPersonalInfo> createState() => _MyPersonalInfoState();
}

class _MyPersonalInfoState extends State<MyPersonalInfo> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNode = FocusNode();

  String? selectedGender;
  String? academic_title;
  String? dob;
  String? contact_number;

  String? _code;
  String? _number;
  String? country;
  File? _image;

  Map<String, dynamic> userData = {};


  Future<UserProfileModel>? _futureUpdatePersonalInfo;


  @override
  void initState() {
    super.initState();
    // Retrieve data from SharedPreferences
    getUserData();
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userDataString = prefs.getString('user_data') ?? '';
    setState(() {
      userData = json.decode(userDataString);
    });
  }



  @override
  Widget build(BuildContext context) {
    return (_futureUpdatePersonalInfo == null) ? buildColumn() : buildFutureBuilder();
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
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                    image:
                                    AssetImage("assets/images/Back_b.png")),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Back",
                                  style: TextStyle(fontSize: 20),
                                )
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
                          padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SingleChildScrollView(
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "My Personal\nInformation",
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
                                      Stack(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              _showSelectPhotoOptions(context);
                                            },
                                            child: _image == null
                                                ? Container(
                                                height: 132,
                                                width:
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(15),
                                                    border: Border.all(
                                                        color: Colors.black
                                                            .withOpacity(
                                                            0.1))),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Icon(
                                                      Icons.upload_file,
                                                      size: 50,
                                                      color: Colors.grey,
                                                    ),
                                                    Text("Upload a picture")
                                                  ],
                                                ))
                                                : Container(
                                              height: 132,
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: FileImage(
                                                          _image!),
                                                      fit: BoxFit.cover),
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(15),
                                                  border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(
                                                          0.1))),
                                            ),
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
                                                child: Icon(
                                                  Icons.delete_forever,
                                                  color: Colors.white,
                                                ),
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
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          children: [

                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 0),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.1))),
                                              child: IntlPhoneField(
                                                focusNode: focusNode,
                                                style: TextStyle(color: Colors.black),
                                                dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.white,),
                                                decoration: InputDecoration(
                                                  // labelText: 'Phone Number',
                                                    border: OutlineInputBorder(

                                                      borderSide: BorderSide(
                                                          color: Colors.transparent
                                                      ),
                                                    ),
                                                    enabledBorder:  new OutlineInputBorder(
                                                      borderSide:  BorderSide(color: Colors.grey.withOpacity(0.1)),
                                                    ),
                                                    focusedBorder:  new OutlineInputBorder(
                                                      borderSide:  BorderSide(color: Colors.grey.withOpacity(0.1)),
                                                    )
                                                ),
                                                languageCode: "en",
                                                initialCountryCode: "GH",
                                                validator: (e){
                                                  if(e == null){
                                                    return 'Contact Number required';
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  _code = value.countryCode.toString();
                                                  _number = value.number.toString();
                                                  country = value.countryISOCode.toString();
                                                },
                                                onCountryChanged: (country) {

                                                },

                                                onSaved: (value) {
                                                  //_onSaveForm(value.toString());
                                                  setState(() {
                                                    _code = value!.countryCode.toString();
                                                    _number = value.number.toString();
                                                    country = value.countryISOCode.toString();

                                                  });

                                                },

                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 10
                                                ,),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.1))),
                                              child: DateTimeFormField(
                                                decoration:
                                                const InputDecoration(
                                                  hintStyle: TextStyle(
                                                      color: Colors.white),
                                                  errorStyle: TextStyle(
                                                      color: Colors.redAccent),
                                                  border: InputBorder.none,
                                                  suffixIcon: Icon(
                                                      Icons.event_note,
                                                      color: Colors.black),
                                                  labelText: 'Date of birth',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                mode: DateTimeFieldPickerMode
                                                    .date,
                                                autovalidateMode:
                                                AutovalidateMode
                                                    .onUserInteraction,
                                                validator: (e) {
                                                  if (e == null) {
                                                    return 'Date of birth required';
                                                  }

                                                  bool isValid =
                                                  isDateBeforeToday(
                                                      e.toString());

                                                  if (isValid) {
                                                  } else {
                                                    return "The dob field must be a date before today.";
                                                  }

                                                  return null;
                                                },
                                                onDateSelected: (DateTime value) {

                                                },
                                                onSaved: (value) {
                                                  setState(() {
                                                    dob = value.toString();
                                                  });
                                                },
                                                dateFormat: DateFormat(
                                                    "dd/MM/yy"), // Specify the desired date format (month/year)
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.1))),
                                              child: GestureDetector(
                                                onTap: () {
                                                  _showGenderSelectionModal(
                                                      context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      border: Border.all(
                                                          color: Colors.white
                                                              .withOpacity(
                                                              0.1))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        selectedGender ??
                                                            'Select Gender',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                0.5)),
                                                      ),
                                                      Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 30,
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.1))),
                                              child: TextFormField(
                                                style: TextStyle(
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  //hintText: 'Enter Username/Email',

                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                      FontWeight.normal),
                                                  labelText: "Academic Title",
                                                  labelStyle: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                      BorderSide(
                                                          color: Colors
                                                              .white)),
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide:
                                                      BorderSide(
                                                          color: Colors
                                                              .white)),
                                                  border: InputBorder.none,
                                                ),
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                      225),
                                                  PasteTextInputFormatter(),
                                                ],
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Academic title required';
                                                  }

                                                  return null;
                                                },
                                                textInputAction:
                                                TextInputAction.next,
                                                autofocus: false,
                                                onSaved: (value) {
                                                  setState(() {
                                                    academic_title = value;
                                                  });
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {


                                          if (_formKey.currentState!.validate()) {
                                            _formKey.currentState!.save();
                                            KeyboardUtil.hideKeyboard(context);

                                            var personal_info_data = {};
                                            personal_info_data["avatar"] = _image!.path;
                                            personal_info_data["contact_number"] = _code.toString() + _number.toString();
                                            personal_info_data["gender"] = selectedGender;
                                            personal_info_data["academic_title"] = academic_title;
                                            personal_info_data["dob"] = dob;

                                            personal_info_data["first_name"] = userData['first_name'];
                                            personal_info_data["last_name"] = userData['last_name'];

                                            personal_info_data["token"] = userData['token'];

                                            print("##############");
                                            print("##############");
                                            print(personal_info_data);

                                            _futureUpdatePersonalInfo = update_personal_info(personal_info_data);


                                            /*  Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder:
                                                        (BuildContext context) =>
                                                        PracticedDetails()));*/

                                          }



                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: happiPrimary,
                                              borderRadius:
                                              BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Continue",
                                              style: TextStyle(
                                                  color: Colors.white),
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

  FutureBuilder<UserProfileModel> buildFutureBuilder() {
    return FutureBuilder<UserProfileModel>(
        future: _futureUpdatePersonalInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);


            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

              saveStatus("Personal Info Complete");


              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PracticedDetails()),
              );



              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) {
                    // Show the dialog
                    return SuccessDialogBox(text: "Personal Info Updated.");
                  }
              );


            });


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
            /*  ListTile(
                title: const Text('Prefer Not To Say'),
                onTap: () {
                  setState(() {
                    selectedGender = 'Prefer Not To Say';
                  });
                  Navigator.pop(context);
                },
              ),*/
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

  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formattedDateTime = formatter.format(dateTime);
    return formattedDateTime;
  }

  bool isDateBeforeToday(String inputDate) {
    DateTime currentDate = DateTime.now();
    DateTime date = DateTime.parse(inputDate);

    // Extract only the date part from the input date
    DateTime inputDateOnly = DateTime(date.year, date.month, date.day);

    // Extract only the date part from the current date
    DateTime currentDateOnly =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    // Check if the input date is before today
    if (inputDateOnly.isBefore(currentDateOnly)) {
      return true;
    } else {
      return false;
    }
  }

  void dispose() {
    super.dispose();
  }

}
