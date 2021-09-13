import 'package:flutter/material.dart';
import '../WidgetsFolder/form_button.dart';
import '../WidgetsFolder/form_text_field.dart';
import '../screens/register_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../services/auth.dart' as auth;
import '../WidgetsFolder/spinner.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authService = auth.AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loading
          ? Spinner()
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: 300,
                      child: Image.asset(
                        'images/girl_login.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange.shade700,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Container(
                                  width: 400,
                                  child: FormTextFieldWidget(
                                    labelText: 'Email',
                                    hintText: 'enter email',
                                    textController: emailController,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Container(
                                  width: 400,
                                  child: FormTextFieldWidget(
                                    labelText: 'Password',
                                    hintText: 'enter password',
                                    textController: passwordController,
                                    obscure: true,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FormButton(
                                text: 'LOGIN',
                                getValuesCallback: () {
                                  var loginFormObj = new Map();
                                  loginFormObj['email'] = emailController.text;
                                  loginFormObj['password'] =
                                      passwordController.text;
                                  return loginFormObj;
                                },
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterScreen(),
                                      ));
                                },
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  var userData =
                                      await authService.signInAnonymous();
                                  if (userData == null) {
                                    print('error sigining in');
                                    setState(() {
                                      loading = false;
                                    });
                                  } else {
                                    print(userData.uid);
                                  }
                                },
                                child: Text(
                                  'LOGIN AS A GUEST',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   elevation: 0,
              //   child: Icon(
              //     Icons.home,
              //     size: 30,
              //     color: Colors.orange.shade900,
              //   ),
              //   backgroundColor: Colors.white,
              // ),
            ),
    );
  }
}
