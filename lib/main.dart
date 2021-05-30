import 'package:finaldairy/addcow1.dart';
import 'package:finaldairy/cow1.dart';
import 'package:finaldairy/navigator.dart';
import 'package:finaldairy/onecow.dart';
import 'package:finaldairy/recordbreeding.dart';
import 'package:finaldairy/recordcalve.dart';
import 'package:finaldairy/recordvaccine.dart';
import 'package:flutter/material.dart';
import 'cow1.dart';
import 'addcow1.dart';
import 'onecow.dart';
import 'deletecow.dart';
import 'successdeletecow.dart';
import 'editcow.dart';
import 'historycow.dart';
import 'addactivity.dart';
import 'recordmilk.dart';
import 'allrecordbreeding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final String name = 'มูมู้';
  final String birthday = '11 ธันวาคม 2559';
  final String code = 'A121';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Nav(),
    );
  }
}
