import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import '../app_colors.dart';

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = AppColors.second;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

class AppDialogs {

  static void toast({required String msg, required ToastStates state}){
    showToast(msg,
     position: ToastPosition.bottom,
      radius: 15,
      textPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      backgroundColor: chooseToastColor(state),
      textAlign: TextAlign.center,
      textStyle: TextStyle(
        fontSize: 16,
       color:  state == ToastStates.success ?
        AppColors.grey1Color :
        Colors.white,
      ),
    );
  }

}