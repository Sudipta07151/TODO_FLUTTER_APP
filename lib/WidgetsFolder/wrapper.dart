import 'package:flutter/material.dart';
import '../screens/taskscreen.dart';
import 'package:provider/provider.dart';
import '../models/user.dart' as u;
import '../screens/login_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<u.User?>(context);
    print(user);
    if (user == null) {
      return LoginScreen();
    } else {
      return TasksScreen();
    }
  }
}
