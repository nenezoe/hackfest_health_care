
import 'package:flutter/material.dart';

import 'input_case_formatter.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final onChanged;
  final IconButton? suffixIcon;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextInputType? keyboardType;
  Function(dynamic value) onSaved;
  Function(dynamic value) onTap;
  bool? isObscure = true;

  CustomTextField({
    this.controller,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.suffixIcon,
    this.isObscure,
    this.enabledBorder,
    this.focusedBorder,
    this.keyboardType,
    required this.onSaved,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.all(10.0),

      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        obscureText: isObscure!,
        cursorColor: Colors.black,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.black),
        inputFormatters: [
          CaseFormatting(),
        ],
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 5),
          suffixIcon: suffixIcon,
          labelText: labelText,
          // enabledBorder: enabledBorder,
          // focusedBorder: focusedBorder,
        ),
      ),

    );
  }
}
