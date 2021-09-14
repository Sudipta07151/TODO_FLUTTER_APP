import 'package:flutter/material.dart';
import '../services/auth.dart';

class FormButton extends StatelessWidget {
  final String text;
  final Function getValuesCallback;
  final Function processDone;
  FormButton(
      {required this.text,
      required this.getValuesCallback,
      required this.processDone});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.fromLTRB(40, 20, 40, 20),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: () async {
        dynamic val = getValuesCallback();
        if (val != null) {
          final authService = AuthService();
          if (val["form"].toString() == "register") {
            dynamic result = await authService.registerWithEmailPassword(
                val["email"].toString(), val["password"].toString());
            if (result == null) {
              print('ERROR');
              processDone(false);
            } else {
              processDone(true);
            }
          } else
            print('LOGIN');
        }
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
