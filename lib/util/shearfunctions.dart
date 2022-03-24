import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';
import 'package:intl/intl.dart';

String getDateDDMMMYYYY(DateTime date) {
  final DateFormat formatter = DateFormat('dd MMM yyyy');
  final String formatted = formatter.format(date);
  return formatted;
}

positiveToast(String text) => Fluttertoast.showToast(
    msg: " $text! ",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0);
negetiveToast(String text) => Fluttertoast.showToast(
    msg: " $text! ",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0);
