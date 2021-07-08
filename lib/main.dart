import 'package:finaldairy/Screens/Cow/addcow1.dart';
import 'package:finaldairy/Screens/Cow/cow1.dart';
import 'package:finaldairy/navigator.dart';
import 'package:finaldairy/Screens/Cow/onecow.dart';
import 'package:finaldairy/recordbreeding.dart';
import 'package:finaldairy/recordcalve.dart';
import 'package:finaldairy/recordvaccine.dart';
import 'package:flutter/material.dart';
import 'Screens/Cow/cow1.dart';
import 'Screens/Cow/addcow1.dart';
import 'Screens/Cow/onecow.dart';
import 'Screens/Cow/deletecow.dart';
import 'Screens/Cow/successdeletecow.dart';
import 'Screens/Cow/editcow.dart';
import 'Screens/Cow/historycow.dart';
import 'addactivity.dart';
import 'recordmilk.dart';
import 'allrecordbreeding.dart';
import 'package:finaldairy/Screens/Welcome/Welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Mitr'),
      home: Welcome(),
    );
  }
}
