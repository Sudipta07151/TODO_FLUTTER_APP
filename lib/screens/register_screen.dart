import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../WidgetsFolder/form_button.dart';
import '../WidgetsFolder/form_text_field.dart';
import '../WidgetsFolder/spinner.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: !loading
          ? Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: 300,
                      child: Image.asset(
                        'images/atomicDelivery.png',
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
                            'REGISTER',
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
                                    labelText: 'Name',
                                    hintText: 'Chris Pratt',
                                    textController: nameController,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 400,
                                  child: FormTextFieldWidget(
                                    labelText: 'Email',
                                    hintText: 'xyz@gmail.com',
                                    textController: emailController,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 400,
                                  child: FormTextFieldWidget(
                                    labelText: 'Password',
                                    hintText: 'abc#123',
                                    obscure: true,
                                    textController: passwordController,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FormButton(
                                text: 'REGISTER',
                                getValuesCallback: () {
                                  var registerFormObj = new Map();
                                  if (!EmailValidator.validate(
                                          emailController.text) ||
                                      nameController.text == '' ||
                                      passwordController.text == '') {
                                    return null;
                                  }
                                  registerFormObj['form'] = 'register';
                                  registerFormObj['name'] = nameController.text;
                                  registerFormObj['email'] =
                                      emailController.text;
                                  registerFormObj['password'] =
                                      passwordController.text;
                                  emailController.text = '';
                                  passwordController.text = '';
                                  nameController.text = '';
                                  setState(() {
                                    loading = true;
                                  });
                                  return registerFormObj;
                                },
                                processDone: (val) => {
                                  if (val == true)
                                    {
                                      Navigator.pop(context),
                                      setState(() {
                                        loading = false;
                                      })
                                    }
                                  else
                                    {
                                      setState(() {
                                        loading = false;
                                      }),
                                      Alert(
                                        context: context,
                                        desc: "SOMETHING WENT WRONG",
                                        image: Image.asset("images/fail.png"),
                                      ).show()
                                    }
                                },
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                elevation: 0,
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.orange.shade900,
                ),
                backgroundColor: Colors.white,
              ),
            )
          : Spinner(),
    );
  }
}
