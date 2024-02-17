import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Components/generic_error_dialog_box.dart';
import 'package:happi_workers_pract/Components/generic_loading_dialogbox.dart';
import 'package:happi_workers_pract/Components/generic_success_dialog_box.dart';
import 'package:happi_workers_pract/Components/keyboard_utils.dart';
import 'package:happi_workers_pract/Onboarding/models/practiced_detail_model.dart';
import 'package:happi_workers_pract/Onboarding/my_documents.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<PracticedDetailModel> update_practiced_details(data) async {
  try {
    print("FUNCTION CALL..!!!!!!");

    final response = await http.post(
      Uri.parse(hostName + "/profile/practice-details"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + data["token"].toString()
      },
      body: jsonEncode({
        "profile_title": data["profile_title"],
        "highest_academic_qualification": data["highest_academic_qualification"],
        "specialization": data["specialization"],
        "approaches": data["approaches"],
        "therapies": data["therapies"],
        "accreditations": data["accreditations"],
        "expertise": {
          "mind": ["anger-management", "autism"],
          "body": ["body-image-issues", "gut-health"],
          "addiction": ["alcohol", "food"],
          "personal_growth": ["mindfulness", "building"],
          "work": ["burnout", "bullying"],
          "relationship": ["insecurity", "intimacy-issues"]
        }
      }),
    );

    print("RESPONSE STATUS CODE: ${response.statusCode}");
    print("RESPONSE BODY: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = json.decode(response.body);
      if (result != null) {
        //await saveUserData(result['userData']);
      }
      return PracticedDetailModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 422 || response.statusCode == 403) {
      return PracticedDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print("EXCEPTION: $e");
    throw e;
  }
}


class PracticedDetails extends StatefulWidget {
  const PracticedDetails({super.key});

  @override
  State<PracticedDetails> createState() => _PracticedDetailsState();
}

class _PracticedDetailsState extends State<PracticedDetails> {
  final _formKey = GlobalKey<FormState>();


  TextEditingController _accred_controller = TextEditingController();
  TextEditingController _therapies_controller = TextEditingController();

  List<String> _accreditations = [];
  List<String> _therapies = [];
  List<String> _approaches = [];

  List<String> _predefinedApproaches = ["Safe", "Creative"];
  List<String> _predefinedTherapies = ["Drama-therapy", "Applied-behaviour-analysis"];


  String? selectedTitle;
  String? selectedQualification;
  String? specialization;

  Map<String, dynamic> userData = {};

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



  Future<PracticedDetailModel>? _futureUpdatePracticedDetail;


  @override
  Widget build(BuildContext context) {
    return (_futureUpdatePracticedDetail == null) ? buildColumn() : buildFutureBuilder();
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
                Container(

                  child: Column(
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
                                              "My Practice\nDetails",
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

                                        Expanded(
                                          child: Form(
                                            key: _formKey,
                                            child: ListView(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(15),
                                                      border:
                                                      Border.all(color: Colors.black.withOpacity(0.1))),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      _showTitleSelectionModal(context);
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
                                                            selectedTitle ?? 'Profile Title',
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
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(15),
                                                      border:
                                                      Border.all(color: Colors.black.withOpacity(0.1))),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      _showQualificationSelectionModal(context);
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
                                                            selectedQualification ?? 'Highest Qualification',
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
                                                      labelText: "Specialization",
                                                      labelStyle: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black.withOpacity(0.5)),
                                                      enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.white)),
                                                      focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.white)),
                                                      border: InputBorder.none,
                                                    ),
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(225),
                                                      PasteTextInputFormatter(),
                                                    ],
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Specialization is required';
                                                      }
                                                      if (value.length < 3) {
                                                        return 'Specialization too short';
                                                      }
                                                      return null;
                                                    },
                                                    textInputAction: TextInputAction.next,
                                                    autofocus: false,
                                                    onSaved: (value) {
                                                      setState(() {
                                                        specialization = value;
                                                      });
                                                    },
                                                  ),
                                                ),


                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15),
                                                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                                                  ),
                                                  child: Wrap(
                                                    spacing: 8.0,
                                                    children: _buildAccredWidgets(),
                                                  ),
                                                ),

                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15),
                                                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                                                  ),
                                                  child: Wrap(
                                                    spacing: 8.0,
                                                    children: _buildApporachWidgets(),
                                                  ),
                                                ),

                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15),
                                                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                                                  ),
                                                  child: Wrap(
                                                    spacing: 8.0,
                                                    children: _buildTherapiesWidgets(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),



                                                InkWell(
                                                  onTap: () {
                                                    if (_formKey.currentState!.validate()) {
                                                      _formKey.currentState!
                                                          .save();
                                                      KeyboardUtil.hideKeyboard(context);

                                                      if(selectedTitle == null) {
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              "You must select a title",),
                                                            backgroundColor: Colors
                                                                .red,
                                                          ),
                                                        );
                                                      }else if(selectedQualification == null) {
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              "You must select a Highest qualification",),
                                                            backgroundColor: Colors
                                                                .red,
                                                          ),
                                                        );
                                                      }  else if(_accreditations.length < 1) {
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              "You must add more than 1 accreditations",),
                                                            backgroundColor: Colors
                                                                .red,
                                                          ),
                                                        );
                                                      }else if(_approaches.length < 2){

                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text("You must select more than 2 approaches",),
                                                            backgroundColor: Colors.red,
                                                          ),
                                                        );

                                                      }else if(_therapies.length < 1){

                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text("You must select more than 1 therapy",),
                                                            backgroundColor: Colors.red,
                                                          ),
                                                        );

                                                      } else {

                                                        var practiced_detail_data = {};
                                                        practiced_detail_data["profile_title"] = selectedTitle;
                                                        practiced_detail_data["highest_academic_qualification"] = selectedQualification;
                                                        practiced_detail_data["specialization"] = specialization;
                                                        _approaches.add("creative");
                                                        practiced_detail_data["approaches"] = _approaches;
                                                        practiced_detail_data["therapies"] = _therapies;
                                                        practiced_detail_data["accreditations"] = _accreditations;


                                                        practiced_detail_data["token"] = userData['token'];

                                                        print("############");
                                                        print(practiced_detail_data);

                                                        _futureUpdatePracticedDetail = update_practiced_details(practiced_detail_data);





                                                      }


                                                    }



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
                                                  height: 30,
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
                  ),
                )
              ],
            )));
  }

  FutureBuilder<PracticedDetailModel> buildFutureBuilder() {
    return FutureBuilder<PracticedDetailModel>(
        future: _futureUpdatePracticedDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingDialogBox(text: 'Please Wait..',);
          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;

            print("#########################");
            //print(data.data!.token!);

            if(data.message == "Practice details updated successfully") {

              saveStatus("Practice Detail Complete");

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      // Show the dialog
                      return SuccessDialogBox(text: "Practice Detail updated.");
                    }
                );
                Future.delayed(Duration(milliseconds: 500), () {
                  // Pop the dialog
                  //Navigator.of(context).pop();

                  // Navigate to the dashboard
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyDocuments()),
                  );
                });




              });


            }

            else  {
              WidgetsBinding.instance.addPostFrameCallback((_) {

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PracticedDetails())
                );

                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context){
                      return ErrorDialogBox(text: 'Error saving data',);
                    }
                );
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




  void _showTitleSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ListTile(
                title: const Text('Certified-life-coach'),
                onTap: () {
                  setState(() {
                    selectedTitle = 'Certified-life-coach';
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



  void _showQualificationSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ListTile(
                title: const Text('Doctoral degree'),
                onTap: () {
                  setState(() {
                    selectedQualification = 'Doctoral degree';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Masters degree'),
                onTap: () {
                  setState(() {
                    selectedQualification = 'Masters degree';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Graduate diploma'),
                onTap: () {
                  setState(() {
                    selectedQualification = 'Graduate diploma';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text('Graduate certificate'),
                onTap: () {
                  setState(() {
                    selectedQualification = 'Graduate certificate';
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





  List<Widget> _buildAccredWidgets() {
    List<Widget> accredWidgets = [];
    for (String tag in _accreditations) {
      accredWidgets.add(Chip(
        label: Text(tag),
        onDeleted: () {
          setState(() {
            _accreditations.remove(tag);
          });
        },
      ));
    }
    accredWidgets.add(
      SizedBox(
        //: 100, // Adjust width accordingly
        child: TextFormField(
          controller: _accred_controller,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Accreditations',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 13
            ),
            border: InputBorder.none,
          ),
          onFieldSubmitted: (value) {
            _addAccredTag(value.trim());
          },
        ),
      ),
    );
    return accredWidgets;
  }

  void _addAccredTag(String tag) {
    if (tag.isNotEmpty) {
      setState(() {
        _accreditations.add(tag);
        _accred_controller.clear();
      });
    }
  }



  List<Widget> _buildApporachWidgets() {
    List<Widget> tagWidgets = [];

    // Add chips for selected tags
    for (String approach in _approaches) {
      tagWidgets.add(Chip(
        label: Text(approach),
        onDeleted: () {
          setState(() {
            _approaches.remove(approach);
          });
        },
      ));
    }

    // Add button for selecting predefined tags
    tagWidgets.add(
      ElevatedButton(
        onPressed: _showApproachDialog,
        child: Text('Select Approach'),
      ),
    );

    return tagWidgets;
  }

  void _showApproachDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Approach'),
          content: SingleChildScrollView(
            child: Column(
              children: _predefinedApproaches.map((approach) {
                return ListTile(
                  title: Text(approach),
                  onTap: () {
                    Navigator.of(context).pop();
                    _addApproach(approach);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }


  void _addApproach(String approach) {
    if (approach.isNotEmpty && !_approaches.contains(approach)) {
      setState(() {
        _approaches.add(approach);
      });
    }
  }



  List<Widget> _buildTherapiesWidgets() {
    List<Widget> tagWidgets = [];

    // Add chips for selected tags
    for (String therapy in _therapies) {
      tagWidgets.add(Chip(
        label: Text(therapy),
        onDeleted: () {
          setState(() {
            _therapies.remove(therapy);
          });
        },
      ));
    }

    // Add button for selecting predefined tags
    tagWidgets.add(
      ElevatedButton(
        onPressed: _showTherapiesDialog,
        child: Text('Select Therapies'),
      ),
    );

    return tagWidgets;
  }

  void _showTherapiesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Therapies'),
          content: SingleChildScrollView(
            child: Column(
              children: _predefinedTherapies.map((approach) {
                return ListTile(
                  title: Text(approach),
                  onTap: () {
                    Navigator.of(context).pop();
                    _addTherapy(approach);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }


  void _addTherapy(String therapy) {
    if (therapy.isNotEmpty && !_therapies.contains(therapy)) {
      setState(() {
        _therapies.add(therapy);
      });
    }
  }



}

