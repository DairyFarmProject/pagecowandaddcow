import 'package:finaldairy/Screens/Cow/cow1.dart';
import 'package:finaldairy/util/shared_preference.dart';

import '../../models/User.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:finaldairy/Screens/Welcome/constants.dart';
import 'package:finaldairy/Screens/Welcome/background.dart';
import 'package:finaldairy/Screens/Welcome/rounded_input_field.dart';
import 'package:finaldairy/Screens/Welcome/rounded_password_field.dart';
import 'package:finaldairy/Screens/Welcome/aleady_have_an_account_acheck.dart';
import 'package:finaldairy/Screens/Welcome/signup.dart';
import '../Cow/cow1.dart';
import 'package:finaldairy/providers/auth.dart';
import '../../providers/user_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
void showInSnackBar(String value) {
  _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(value)));
}

class HttpException implements Exception {
  final message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  String? _email, _password;
  bool isLoading = false;

  void _showerrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'An Error Occurs',
          style: TextStyle(color: Colors.blue),
        ),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          child: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
                SizedBox(height: size.height * 0.03),
                Image.asset(
                  "assets/images/flower2.png",
                  height: size.height * 0.2,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  controller: emailController,
                  hintText: "อีเมล",
                  onSaved: (value) => _email = value,
                  onChanged: (String email) {
                    _email = email;
                  },
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
                RoundedPasswordField(
                  controller: passwordController,
                  onSaved: (value) => _password = value,
                  onChanged: (String password) {
                    _password = password;
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: kPrimaryColor,
                      onPressed: () {
                        if (isLoading) {
                          return;
                        }
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          _scaffoldKey.currentState!.showSnackBar(SnackBar(
                              content: Text("Please Fill all fileds")));
                          return;
                        }
                        //doLogin();
                        login(emailController.text, passwordController.text);
                        setState(() {
                          isLoading = true;
                        });
                      },
                      child: Text(
                        'เข้าสู่ระบบ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  login(email, password) async {
    Map data = {'email': email, 'password': password};
    print(data.toString());
    final response = await http.post(Uri.http('10.0.2.2:3000', 'signin'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> resposne = jsonDecode(response.body);
      Map<String, dynamic> user = resposne['data'];
      savePref(user['token']);
      UserPreferences().getToken(user['token']);
      doLogin(user['token']);
    } else {
      _scaffoldKey.currentState
          ?.showSnackBar(SnackBar(content: Text("Please try again!")));
    }
  }

  savePref(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token.toString());
    preferences.commit();
  }

  doLogin(String token) async {
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
    final Future<Map<String, dynamic>> successfulMessage = auth.login(token);

    successfulMessage.then((response) {
      if (response["user"] != null) {
        User user = response["user"];
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return Cow();
        // }));
      } else {
        Flushbar(
          title: "Failed Login",
          message: response['message']['message'].toString(),
          duration: Duration(seconds: 3),
        ).show(context);
      }
    });
  }
}
