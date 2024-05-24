import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:alarm_app/core/utils/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'app_colors.dart';

class AppConstant {
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black, textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  child: const Text('Ok'),
                )
              ],
            ));
  }

  static Future<void> showCustomSnakeBar(context, msg, isSuccess) async {
    if (msg != "" && msg != null) {
      Flushbar(
        message: msg,
        messageSize: 12,
        icon: isSuccess
            ? const Icon(
                Icons.check,
                size: 28.0,
                color: Colors.green,
              )
            : Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red)),
                child: const Icon(
                  Icons.close,
                  size: 28.0,
                  color: Colors.red,
                ),
              ),
        margin: const EdgeInsets.all(8),
        flushbarStyle: FlushbarStyle.FLOATING,
        borderRadius: BorderRadius.circular(8),
        duration: const Duration(seconds: 3),
        leftBarIndicatorColor: Colors.blue[300],
      ).show(context);
    }
  }

  static void showToast(
      {required String msg, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        msg: msg,
        backgroundColor: color ?? AppColors.primary,
        gravity: gravity ?? ToastGravity.BOTTOM);
  }

  static void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget,));

  static void navigateToAndFinish(context, widget) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget,),
        (Route<dynamic> route) => false,
      );

  static void showSnackBar(BuildContext context, String errorMsg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorMsg),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 5),
    ));
  }

  static void showCustomProgressIndicator(BuildContext context) {
    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return SpinKitFadingCircle(color: AppColors.primary);
      },
    );
  }

  static String formatTime({DateTime? dateTime}) {
    return DateFormat.jms().format(dateTime ?? DateTime.now());
  }

  static String formatDate({DateTime? dateTime}) {
    return DateFormat.yMMMEd().format(dateTime ?? DateTime.now());
  }

  static Widget customDivider() {
    return Container(
      height: 2,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .02),
      color: Colors.grey.withOpacity(0.1),
    );
  }

  static String formatUserName({required String username}) {
    List<String> userList = username.split(" ");
    if (userList.length >= 2) {
      return "${userList[0][0]} ${userList[1][0]}";
    } else {
      return "${username[0]} ${username[1]}";
    }
  }
}

