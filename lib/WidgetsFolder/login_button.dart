import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Icon(
        Icons.login,
        color: Colors.green.shade500,
      ),
    );
  }
}
