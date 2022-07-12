import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTTextFild extends StatelessWidget {
  FormTTextFild(
      {Key? key,
      this.hinttext,
      this.icon,
      this.controller,
      this.keyboardType,
      this.maxLines,
      this.num})
      : super(key: key);

  final String? hinttext;
  final IconData? icon;
  final int? num;
  final int? maxLines;
  TextEditingController? controller;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: TextField(
        inputFormatters: [LengthLimitingTextInputFormatter(num)],
        keyboardType: keyboardType,
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,

          fillColor: Color.fromARGB(255, 240, 240, 240),
          hintStyle: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
          hintText: hinttext,
          // icon: Icon(
          //   icon,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }
}
