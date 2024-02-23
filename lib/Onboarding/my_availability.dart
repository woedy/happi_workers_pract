import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happi_workers_pract/Authentication/SignIn/sign_in_screen.dart';
import 'package:happi_workers_pract/Authentication/SignUp/sign_up_password.dart';
import 'package:happi_workers_pract/Onboarding/my_availabilityList.dart';
import 'package:happi_workers_pract/Onboarding/my_documents2.dart';
import 'package:happi_workers_pract/Onboarding/practiced_details.dart';
import 'package:happi_workers_pract/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyAvailability extends StatefulWidget {
  const MyAvailability({super.key});

  @override
  State<MyAvailability> createState() => _MyAvailabilityState();
}

class _MyAvailabilityState extends State<MyAvailability> {
  final _formKey = GlobalKey<FormState>();
  String? selectedInterval;

  String selectedMonth = 'Select Month';
  List<DateTime> selectedMonthDays = [];
  int? selectedMonthIndex;
  int? selectedDayIndex;
  Set<int> selectedHourIndices = Set();
  List<String> hourlySlots = List.generate(24, (index) {
    String hour = (index < 10) ? '0$index' : '$index';
    return '$hour:00';
  });

  List<Map<String, dynamic>> availabilityList = [];

  List<Map<String, String>>? _availability_list;



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

                            /*  InkWell(
                                child: Text("Add recuring availability", style: TextStyle(color: happiPrimary, fontWeight: FontWeight.bold),),
                              ),*/
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
                                            "My Availability",
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

                                      Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            color: happiGreen.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Minimum time frame before clients can book an appointment with you:", style: TextStyle(fontSize: 12, color: happiPrimary),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                  border:
                                                  Border.all(color: Colors.black.withOpacity(0.1))),
                                              child: GestureDetector(
                                                onTap: () {
                                                  _showIntervalSelectionModal(context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(5),
                                                  width: 150,

                                                  //height: 10,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(
                                                          color: Colors.white.withOpacity(0.1))
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        selectedInterval ?? 'Select Interval',
                                                        style: TextStyle(fontSize: 13,
                                                            color: Colors.black.withOpacity(0.5)),
                                                      ),
                                                      Icon(Icons.arrow_drop_down, size: 30, color: Colors.black,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Container(

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Select month", style: TextStyle(fontSize: 12, color: happiPrimary),),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            Row(
                                              children: [
                                                Expanded(

                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:
                                                        Border.all(color: Colors.black.withOpacity(0.1))),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _showMonthModal(context);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(5),
                                                        width: 150,

                                                        //height: 10,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            border: Border.all(
                                                                color: Colors.white.withOpacity(0.1))
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              selectedMonth ?? 'Select Month',
                                                              style: TextStyle(fontSize: 13,
                                                                  color: Colors.black.withOpacity(0.5)),
                                                            ),
                                                            Icon(Icons.arrow_drop_down, size: 30, color: Colors.black,),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Container(),
                                                )
                                                /*Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                        border:
                                                        Border.all(color: Colors.black.withOpacity(0.1))),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        _showIntervalSelectionModal(context);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(5),
                                                        width: 150,

                                                        //height: 10,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            border: Border.all(
                                                                color: Colors.white.withOpacity(0.1))
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              '21-27 Aug. 2023',
                                                              style: TextStyle(fontSize: 13,
                                                                  color: Colors.black.withOpacity(0.5)),
                                                            ),
                                                            Icon(Icons.arrow_drop_down, size: 30, color: Colors.black,),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),*/
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      Divider(
                                        thickness: 1,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Container(


                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Select a day", style: TextStyle(fontSize: 12, color: happiPrimary),),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            Container(
                                              height: 50,
                                              child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: selectedMonthDays.length,
                                                  itemBuilder: (BuildContext context, int index){
                                                    DateTime date = selectedMonthDays[index];

                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedDayIndex = index;
                                                          selectedHourIndices.clear(); // Clear selected hours when changing day
                                                        });
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                                            decoration: BoxDecoration(
                                                                color: selectedDayIndex == index ? Colors.blue : Colors.white,
                                                                borderRadius: BorderRadius.circular(10),
                                                                border:
                                                                Border.all(color: Colors.black.withOpacity(0.1))),
                                                            child: Container(
                                                              padding: EdgeInsets.all(12),
                                                              width: 150,

                                                              //height: 10,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                  border: Border.all(
                                                                      color: Colors.white.withOpacity(0.1))
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Text(
                                                                    '${date.day}${_getDaySuffix(date.day)}',
                                                                    style: TextStyle(fontSize: 13,
                                                                      color: selectedDayIndex == index ? Colors.white : Colors.black.withOpacity(0.5),
                                                                  ),),
                                                                  SizedBox(width: 5),
                                                                  Text(
                                                                    selectedMonth,
                                                                    style: TextStyle(
                                                                      fontSize: 13,
                                                                      color: selectedDayIndex == index ? Colors.white : Colors.black.withOpacity(0.5),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10 ,
                                                          )
                                                        ],
                                                      ),
                                                    );

                                              })
                                            ),



                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        thickness: 1,
                                      ),


                                      SizedBox(
                                        height: 10,
                                      ),


                                      Container(

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Select time slots for the select day", style: TextStyle(fontSize: 12, color: happiPrimary),),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            if (selectedDayIndex != null)
                                              Container(
                                                height: 50,
                                                child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: hourlySlots.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          if (selectedHourIndices.contains(index)) {
                                                            selectedHourIndices.remove(index);
                                                          } else {
                                                            selectedHourIndices.add(index);
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.symmetric(horizontal: 4),
                                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                                        decoration: BoxDecoration(
                                                          color: selectedHourIndices.contains(index) ? Colors.blue : Colors.white,
                                                          borderRadius: BorderRadius.circular(10),
                                                          border: Border.all(color: Colors.black.withOpacity(0.1)),
                                                        ),
                                                        child: Container(
                                                          padding: EdgeInsets.all(12),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            border: Border.all(color: Colors.white.withOpacity(0.1)),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              hourlySlots[index],
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color: selectedHourIndices.contains(index) ? Colors.white : Colors.black.withOpacity(0.5),
                                                                fontWeight: selectedHourIndices.contains(index) ? FontWeight.bold : FontWeight.normal,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),


                                      SizedBox(
                                        height: 10,
                                      ),

                                      Divider(
                                        thickness: 1,
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text("Add session to calender", style: TextStyle(fontSize: 12, color: Colors.red),),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Image(image: AssetImage("assets/images/calenbut.png")),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image(image: AssetImage("assets/images/calen1.png")),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image(image: AssetImage("assets/images/calen2.png")),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image(image: AssetImage("assets/images/calen3.png")),
                                        ],
                                      ),


                                      


                                      SizedBox(
                                        height: 20,
                                      ),


                                      InkWell(
                                        onTap: () {
                                          if(selectedHourIndices.isEmpty) {
                                            print("Time is empty");

                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("You must select at least a time slot",),
                                                backgroundColor: Colors.red,
                                              ),
                                            );

                                          }else{
                                            _onSaveAndAddMore();
                                          }

                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              "Save & Add More",
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
                                          if(selectedHourIndices.isEmpty) {
                                            print("Time is empty");

                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("You must select at least a time slot",),
                                                backgroundColor: Colors.red,
                                              ),
                                            );

                                          }else{
                                            if(selectedInterval == null){
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("You must select an availability interval",),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            }else{
                                              _onSaveAndContinue();
                                              print("################ availabilityList");
                                              print(availabilityList);

                                              List outputData = convertData(availabilityList);
                                              print(outputData);


                                                               Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyAvailabilityList(
                                                availability_data: availabilityList,
                                                display_data: outputData,
                                                minimum_booking_time_frame: selectedInterval
                                                ,)));
                                            }

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




  void _showIntervalSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('1 hour'),
                onTap: () {
                  setState(() {
                    selectedInterval = '1 hour';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('6 hours'),
                onTap: () {
                  setState(() {
                    selectedInterval = '6 hours';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('8 hours'),
                onTap: () {
                  setState(() {
                    selectedInterval = '8 hours';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('12 hours'),
                onTap: () {
                  setState(() {
                    selectedInterval = '12 hours';
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text('24 hours'),
                onTap: () {
                  setState(() {
                    selectedInterval = '24 hours';
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



  void _showMonthModal(BuildContext context) {
    List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: months.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                months[index],
                style: TextStyle(
                  color: selectedMonthIndex == index ? Colors.blue : Colors.black,
                  fontWeight: selectedMonthIndex == index ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              onTap: () {
                setState(() {
                  selectedMonth = months[index];
                  selectedMonthIndex = index;
                  selectedMonthDays = [];

                  // Generate a list of DateTime objects for all days in the selected month
                  DateTime firstDay = DateTime(DateTime.now().year, index + 1, 1);
                  DateTime lastDay = DateTime(DateTime.now().year, index + 2, 0);

                  for (int i = 0; i < lastDay.day; i++) {
                    selectedMonthDays.add(firstDay.add(Duration(days: i)));
                  }

                  // Clear selected day and hour when changing month
                  selectedDayIndex = null;
                  selectedHourIndices.clear();
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }


  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }


  void _onSaveAndAddMore() {
    // Construct JSON object
    String selectedDate = selectedDayIndex != null ? selectedMonthDays[selectedDayIndex!].toString().split(' ')[0] : '';
    List<String> selectedTimes = selectedHourIndices.map((index) => hourlySlots[index]).toList();

    Map<String, dynamic> availability = {
      'date': selectedDate.toString(),
      'time': selectedTimes,
    };

    availabilityList.add(availability);
    print('Availability saved:\n$availabilityList');

    // Clear selection for next input
    setState(() {
      selectedDayIndex = null;
      selectedHourIndices.clear();
    });
  }

  void _onSaveAndContinue() {
    // Construct JSON object
    String selectedDate = selectedDayIndex != null ? selectedMonthDays[selectedDayIndex!].toString().split(' ')[0] : '';
    List<String> selectedTimes = selectedHourIndices.map((index) => hourlySlots[index]).toList();

    Map<String, dynamic> availability = {
      'date': selectedDate.toString(),
      'time': selectedTimes,
    };

    availabilityList.add(availability);
    print('Availability saved:\n$availabilityList');

    // Continue to the next screen or perform any other action
  }



  List<Map<String, String>> convertData(List<Map<String, dynamic>> originalData) {
    List<Map<String, String>> convertedData = [];

    originalData.forEach((element) {
      String date = element['date'];
      List<String> times = List<String>.from(element['time']);

      times.forEach((time) {
        convertedData.add({
          'date': '${date.substring(0, 4)}-${_getMonthAbbreviation(date.substring(5, 7))}-${date.substring(8)}',
          'time': time,
        });
      });
    });

    return convertedData;
  }

  String _getMonthAbbreviation(String monthNumber) {
    switch (monthNumber) {
      case '01':
        return 'Jan';
      case '02':
        return 'Feb';
      case '03':
        return 'Mar';
      case '04':
        return 'Apr';
      case '05':
        return 'May';
      case '06':
        return 'Jun';
      case '07':
        return 'Jul';
      case '08':
        return 'Aug';
      case '09':
        return 'Sep';
      case '10':
        return 'Oct';
      case '11':
        return 'Nov';
      case '12':
        return 'Dec';
      default:
        return '';
    }
  }



}
