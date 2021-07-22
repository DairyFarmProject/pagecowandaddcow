import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:finaldairy/Screens/Welcome/constants.dart';
import 'package:finaldairy/Screens/Welcome/background.dart';
import 'package:finaldairy/Screens/Welcome/rounded_input_field.dart';
import 'package:finaldairy/Screens/Welcome/rounded_password_field.dart';
import 'package:finaldairy/Screens/Welcome/aleady_have_an_account_acheck.dart';
import 'package:finaldairy/Screens/Welcome/signup.dart';
import 'package:finaldairy/Screens/Welcome/auth.dart';
import 'package:finaldairy/models/UserDairys.dart';

Future<List<UserDairys>> getUserDairys() async {
  final response = await http.get(Uri.http('10.0.2.2:3000', 'user'));

  Map<String, dynamic> data = jsonDecode(response.body);
  final List list = data['data'];

  List<UserDairys> users = list.map((e) => UserDairys.fromMap(e)).toList();

  return users;
}

//UserDairys user = UserDairys();
String? _email, _password;
Map<String, String> _authData = {'email': '', 'password': ''};
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

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  Future _submit() async {
    if (!_formKey.currentState!.validate()) {
      showInSnackBar('Please fix the errors in red before submitting.');
    }
    _formKey.currentState!.save();
    try {
      await Provider.of<Auth>(context, listen: false)
          .login(_authData['email'], _authData['password']);
    } on HttpException catch (e) {
      var errorMessage = 'Authentication Failed';
      if (e.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'Invalid email';
        _showerrorDialog(errorMessage);
      } else if (e.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'This email not found';
        _showerrorDialog(errorMessage);
      } else if (e.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid Password';
        _showerrorDialog(errorMessage);
      }
    } catch (error) {
      // print(error);
      var errorMessage = 'Plaese try again later';
      _showerrorDialog(errorMessage);
    }
  }

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
                  hintText: "อีเมล",
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
                        _submit();
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
  
}
