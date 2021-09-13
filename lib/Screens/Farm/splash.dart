import 'package:finaldairy/Screens/Cow/cow1.dart';
import 'package:finaldairy/Screens/Farm/home.dart';
import 'package:finaldairy/models/CheckEmail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:finaldairy/models/User.dart';
import 'package:finaldairy/providers/user_provider.dart';
import '../../util/register_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false)
        .isAlreadyAuthenticated()
        .then((result) {
          print(result);
      if (result) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Cow();
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Home();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
