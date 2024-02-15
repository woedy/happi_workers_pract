import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedMonth = '';
  List<DateTime> selectedMonthDays = [];
  int? selectedMonthIndex;
  int? selectedDayIndex;
  Set<int> selectedHourIndices = Set();
  List<String> hourlySlots = List.generate(24, (index) {
    String hour = (index < 10) ? '0$index' : '$index';
    return '$hour:00';
  });

  List<Map<String, dynamic>> availabilityList = [];

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

  void _onSaveAndAddMore() {
    // Construct JSON object
    String selectedDate = selectedDayIndex != null ? selectedMonthDays[selectedDayIndex!].toString().split(' ')[0] : '';
    List<String> selectedTimes = selectedHourIndices.map((index) => hourlySlots[index]).toList();

    Map<String, dynamic> availability = {
      'date': selectedDate,
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
      'date': selectedDate,
      'time': selectedTimes,
    };

    availabilityList.add(availability);
    print('Availability saved:\n$availabilityList');

    // Continue to the next screen or perform any other action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Selection'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () => _showMonthModal(context),
              child: Text('Select Month'),
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selectedMonthDays.length,
              itemBuilder: (BuildContext context, int index) {
                DateTime date = selectedMonthDays[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDayIndex = index;
                      selectedHourIndices.clear(); // Clear selected hours when changing day
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: selectedDayIndex == index ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black.withOpacity(0.1)),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white.withOpacity(0.1)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${date.day}${_getDaySuffix(date.day)}',
                            style: TextStyle(
                              fontSize: 13,
                              color: selectedDayIndex == index ? Colors.white : Colors.black.withOpacity(0.5),
                            ),
                          ),
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
                );
              },
            ),
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _onSaveAndAddMore,
              child: Text('Save and Add More'),
            ),
            ElevatedButton(
              onPressed: _onSaveAndContinue,
              child: Text('Save and Continue'),
            ),
          ],
        ),
      ),
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
}
