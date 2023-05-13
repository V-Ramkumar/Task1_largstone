import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Colors.dart';
class AppWidgets {



  void showSuccessToastMsg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg,
      textColor: Appcolors.whitecolor,
      backgroundColor: Appcolors.primaryColor,
      gravity: ToastGravity.BOTTOM,
      fontSize: 14,
      timeInSecForIosWeb: 2,
    );
  }


  void showErrorToastMsg(String msg) {
    Fluttertoast.showToast(msg: msg,
      textColor: Appcolors.whitecolor,
      backgroundColor: Colors.red,
      gravity: ToastGravity.BOTTOM,
      fontSize: 14,
      timeInSecForIosWeb: 2,
    );
  }


}