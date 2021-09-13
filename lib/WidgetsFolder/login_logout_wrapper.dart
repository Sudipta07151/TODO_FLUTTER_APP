import 'package:flutter/material.dart';
import '../WidgetsFolder/login_button.dart';
import '../WidgetsFolder/logout_button.dart';
import 'package:provider/provider.dart';
import './/models/user.dart' as u;

class LoginLogoutWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<u.User?>(context);
    print(user);
    if (user == null) {
      return LoginButton();
    } else {
      return LogoutButton();
    }
  }
}
