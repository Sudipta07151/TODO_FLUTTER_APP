import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final Function getValuesCallback;
  FormButton({required this.text, required this.getValuesCallback});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.fromLTRB(40, 20, 40, 20),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: () {
        dynamic val = getValuesCallback();
        print('VALUE GOT is $val');
      },
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: Colors.orange.shade700,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
