import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Icon(
        Icons.logout,
        color: Colors.red.shade700,
      ),
    );
  }
}
