import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_documents.dart';
import 'package:happi_workers_pract/constants.dart';

class PracticedDetails extends StatefulWidget {
  const PracticedDetails({super.key});

  @override
  State<PracticedDetails> createState() => _PracticedDetailsState();
}

class _PracticedDetailsState extends State<PracticedDetails> {
  final _formKey = GlobalKey<FormState>();

  String? selectedTitle;
  String? selectedQualification;
  String? selectedApproach;
  String? selectedTherapiesOffered;


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

                                      Form(
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
                                                    return 'Email is required';
                                                  }
                                                  if (value.length < 3) {
                                                    return 'Name too short';
                                                  }
                                                  String pattern =
                                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                                      r"{0,253}[a-zA-Z0-9])?)*$";
                                                  RegExp regex = RegExp(pattern);
                                                  if (!regex.hasMatch(value))
                                                    return 'Enter a valid email address';

                                                  return null;
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
                                                  labelText: "Accreditations",
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
                                                    return 'Email is required';
                                                  }
                                                  if (value.length < 3) {
                                                    return 'Name too short';
                                                  }
                                                  String pattern =
                                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                                      r"{0,253}[a-zA-Z0-9])?)*$";
                                                  RegExp regex = RegExp(pattern);
                                                  if (!regex.hasMatch(value))
                                                    return 'Enter a valid email address';

                                                  return null;
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
                                              child: GestureDetector(
                                                onTap: () {
                                                  _showApproachSelectionModal(context);
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
                                                        selectedApproach ?? 'My Approach Is (Choose 3 Approaches)',
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
                                              height: 30,
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
                                                  _showTherapiesOfferedSelectionModal(context);
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
                                                        selectedTherapiesOffered ?? 'Therapies Offered (More than one if applicable)',
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
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyDocuments()));
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


  void _showTitleSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ListTile(
                title: const Text('Dr'),
                onTap: () {
                  setState(() {
                    selectedTitle = 'Dr';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Mr'),
                onTap: () {
                  setState(() {
                    selectedTitle = 'Mr';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Mrs'),
                onTap: () {
                  setState(() {
                    selectedTitle = 'Mrs';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text('Prof'),
                onTap: () {
                  setState(() {
                    selectedTitle = 'Prof';
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



  void _showApproachSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ListTile(
                title: const Text('Approach 1'),
                onTap: () {
                  setState(() {
                    selectedApproach = 'Approach 1';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Approach 2'),
                onTap: () {
                  setState(() {
                    selectedApproach = 'Approach 2';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Approach 3'),
                onTap: () {
                  setState(() {
                    selectedApproach = 'Approach 3';
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
 void _showTherapiesOfferedSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ListTile(
                title: const Text('Therapy 1'),
                onTap: () {
                  setState(() {
                    selectedTherapiesOffered = 'Therapy 1';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Therapy 2'),
                onTap: () {
                  setState(() {
                    selectedTherapiesOffered = 'Therapy 2';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Therapy 3'),
                onTap: () {
                  setState(() {
                    selectedTherapiesOffered = 'Therapy 3';
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
