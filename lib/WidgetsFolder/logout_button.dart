import 'package:flutter/material.dart';
import '../services/auth.dart';

class LogoutButton extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        await _auth.signingOut();
      },
      child: Icon(
        Icons.logout,
        color: Colors.red.shade700,
      ),
    );
  }
}
