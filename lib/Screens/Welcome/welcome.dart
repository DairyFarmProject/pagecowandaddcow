import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finaldairy/Screens/Welcome/background.dart';
import 'package:finaldairy/Screens/Welcome/rounded_button.dart';
import 'package:finaldairy/Screens/Welcome/login.dart';
import 'package:finaldairy/Screens/Welcome/signup.dart';
import 'package:finaldairy/Screens/Welcome/constants.dart';
import '../../util/register_store.dart';
import 'package:provider/provider.dart';
import 'register.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

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
              "Dairy Cattle 4.0",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/cow.png",
              height: size.height * 0.40,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "เข้าสู่ระบบ",
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
            RoundedButton(
              text: "สมัครใช้งาน",
              color: kPrimaryLightColor,
              textColor: Colors.black,
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
    )));
  }
}
