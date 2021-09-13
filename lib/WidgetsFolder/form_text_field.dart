import 'package:flutter/material.dart';

class FormTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final obscure;
  final textController;
  FormTextFieldWidget(
      {required this.labelText,
      required this.hintText,
      this.obscure = false,
      required this.textController});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      obscureText: obscure,
      cursorWidth: 5,
      expands: false,
      style: TextStyle(
        letterSpacing: 2,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        focusColor: Colors.white,
        fillColor: Colors.white,
        labelText: labelText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
          color: Colors.white,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange.shade700,
            width: 3,
          ),
        ),
      ),
    );
  }
}
