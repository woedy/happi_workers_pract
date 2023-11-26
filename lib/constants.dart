import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

const happiPrimary = Color(0xff533593);
const happiDark = Color(0xff251C36);
const happiGreen = Color(0xff2CD788);
const happiWhite = Color(0xffF8F7FC);
const happiLghtPurple = Color(0xffE4D8FF);

const bodyText1 = Color(0xffffffff);
const bodyText2 = Color(0xffffffff);
const clay = Color(0xffa499b3);


const hostName = "https://libra.teamalfy.co.uk";
const socketHostName = "wss://libra.teamalfy.co.uk";


Future<String?> getApiPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("API_Key");
}



Future<String?> getUserIDPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("USER_ID");
}



class PasteTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow pasting of text by returning the new value unchanged
    return newValue;
  }
}




