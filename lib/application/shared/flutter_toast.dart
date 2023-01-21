import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast {
  void showToast({String? message, String kind = 'success'}) {
    Fluttertoast.showToast(
      msg: message ?? '',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: kind == 'success' ? Colors.green[300] : Colors.red[300],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
