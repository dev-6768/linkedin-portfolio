import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilFunctions {
  static flutterToastFunction(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}