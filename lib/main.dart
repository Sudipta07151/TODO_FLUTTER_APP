import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import '../screens/taskscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import '../WidgetsFolder/wrapper.dart';
import '../models/user.dart' as u;
import '../services/auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ToDo());
}

class ToDo extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
          initialRoute: '/',
          home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text('SOMETHING GONE WRONG!',
                        style: TextStyle(color: Colors.orange.shade700)),
                  ),
                );
              } else if (snapshot.hasData) {
                return StreamProvider<u.User?>.value(
                  // child: TasksScreen(),
                  child: Wrapper(),
                  value: AuthService().user,
                  initialData: null,
                );
              } else {
                return Scaffold(
                  body: CircularProgressIndicator(
                    backgroundColor: Colors.orangeAccent,
                  ),
                );
              }
            },
          )),
    );
  }
}
