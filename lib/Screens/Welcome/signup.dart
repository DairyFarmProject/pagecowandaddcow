import 'package:flutter/material.dart';
import 'package:finaldairy/Screens/Welcome/background.dart';
import 'package:finaldairy/Screens/Welcome/rounded_input_field.dart';
import 'package:finaldairy/Screens/Welcome/rounded_button.dart';
import 'package:finaldairy/Screens/Welcome/rounded_password_field.dart';
import 'package:finaldairy/Screens/Welcome/aleady_have_an_account_acheck.dart';
import 'package:finaldairy/Screens/Welcome/login.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "SIGNUP",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
                SizedBox(height: size.height * 0.03),
                Image.asset(
                  "assets/images/flower3.png",
                  height: size.height * 0.25,
                ),
                RoundedInputField(
                  hintText: "อีเมล",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: "สมัครใช้งาน",
                  press: () {},
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
