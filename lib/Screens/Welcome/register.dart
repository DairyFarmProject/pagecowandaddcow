import 'dart:convert';
import 'package:finaldairy/Screens/Welcome/welcome.dart';
import 'package:finaldairy/models/CheckEmail.dart';
import 'package:finaldairy/models/UserDairys.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/CheckEmail.dart';
import '../Farm/text_field_container.dart';
import 'welcome.dart';
import '../../models/UserDairys.dart';
import '../../util/register_store.dart';
import '../../util/shared_preference.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  bool _isInit = true;

  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late CheckEmail args;
  late String user_id;
  late String email;
  late String password;
  bool isLoading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? firebaseUser;
  late String actualCode;
  late String _verificationId;
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  //final birthdayController = TextEditingController();
  final mobileController = TextEditingController();
  final user_imageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _smsController = TextEditingController();
  final value_validator = RequiredValidator(errorText: "X Invalid");

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget._isInit) {
      args = ModalRoute.of(context)!.settings.arguments as CheckEmail;
      user_id = args.user_id;
      email = args.email;
      password = args.password;
      widget._isInit = false;
    }
  }

  DateTime? _dateTime;
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterStore>(builder: (_, loginStore, __) {
      return Observer(
          builder: (_) => (Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Colors.white,
                              ))),
                    ),
                    Center(
                      child: Text('DairyCattle'),
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.account_circle,
                            color: Colors.green[400], size: 30),
                        onPressed: () {},
                      ),
                    )),
                  ],
                ),
                backgroundColor: Colors.green[400],
                key: loginStore.loginScaffoldKey,
              ),
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text('สร้างบัญชีผู้ใช้งาน',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 25)),
                        ),
                        TextFieldContainer(
                            controller: firstnameController,
                            onChanged: (value) {},
                            validator: value_validator,
                            child: Text(
                              'ชื่อ',
                              style: TextStyle(fontSize: 15),
                            ),
                            hintText: "ชื่อ"),
                        TextFieldContainer(
                            controller: lastnameController,
                            onChanged: (value) {},
                            validator: value_validator,
                            child: Text(
                              'นามสกุล',
                              style: TextStyle(fontSize: 15),
                            ),
                            hintText: "นามสกุล"),
                        Container(
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 20, 0, 0),
                                          child: Text(
                                            'วันเกิด',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(40, 20, 0, 20),
                                        child: Text(
                                          _dateTime == null
                                              ? 'วัน/เดือน/ปี'
                                              : '${DateFormat('dd-MM-yyyy').format(DateTime.parse(_dateTime.toString()))}',
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 15, 0, 10),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.calendar_today_sharp,
                                            color: Colors.blueGrey,
                                          ),
                                          onPressed: () {
                                            showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1970),
                                                lastDate: DateTime(2022),
                                                builder: (context, picker) {
                                                  return Theme(
                                                    data: ThemeData.light()
                                                        .copyWith(
                                                      colorScheme:
                                                          ColorScheme.dark(
                                                        primary: Colors.green,
                                                        onPrimary: Colors.white,
                                                        surface: Colors.green,
                                                        onSurface:
                                                            Color(0xFF77dd77),
                                                      ),
                                                      dialogBackgroundColor:
                                                          Colors.white,
                                                    ),
                                                    child: picker!,
                                                  );
                                                }).then((date) {
                                              setState(() {
                                                _dateTime = date;
                                              });
                                            });
                                          },
                                        ),
                                      )
                                    ])
                                  ]),
                            ],
                          ),
                        ),
                        TextFieldContainer(
                            controller: mobileController,
                            onChanged: (value) {},
                            validator: value_validator,
                            child: Text(
                              'เบอร์มือถือ',
                              style: TextStyle(fontSize: 15),
                            ),
                            hintText: "เบอร์มือถือ"),
                        TextFieldContainer(
                            controller: user_imageController,
                            onChanged: (value) {},
                            validator: value_validator,
                            child: Text(
                              'รูปโปรไฟล์',
                              style: TextStyle(fontSize: 15),
                            ),
                            hintText: "รูปโปรไฟล์"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RaisedButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Welcome();
                                        }));
                                      },
                                      color: Colors.blueGrey[50],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(39))),
                                      child: Text(
                                        'ยกเลิก',
                                        style: TextStyle(
                                            color: Color(0xffd6786e),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 10, 30, 10),
                                    )
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Column(
                                  children: [
                                    // ignore: deprecated_member_use
                                    RaisedButton(
                                      onPressed: () {
                                        if (isLoading) {
                                          return;
                                        }
                                        if (firstnameController.text.isEmpty) {
                                          _scaffoldKey.currentState
                                              ?.showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Please Enter Firstname")));
                                          return;
                                        }
                                        if (lastnameController.text.isEmpty) {
                                          _scaffoldKey.currentState
                                              ?.showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Please Enter Lastname")));
                                          return;
                                        }
                                        if (_dateTime == null) {
                                          _scaffoldKey.currentState
                                              ?.showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Please Enter BirthDay")));
                                          return;
                                        }
                                        if (mobileController.text.isEmpty) {
                                          _scaffoldKey.currentState
                                              ?.showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Please Enter Mobile")));
                                          return;
                                        }
                                        if (user_imageController.text.isEmpty) {
                                          _scaffoldKey.currentState
                                              ?.showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Please Enter Image")));
                                          return;
                                        }
                                        if (mobileController.text.isNotEmpty) {
                                          UserPreferences().saveRegister(
                                              args.user_id,
                                              firstnameController.text,
                                              lastnameController.text,
                                              '${DateFormat('yyyy-MM-dd').format(DateTime.parse(_dateTime.toString()))}',
                                              mobileController.text.toString(),
                                              user_imageController.text,
                                              args.email,
                                              args.password);
                                          loginStore.getCodeWithPhoneNumber(
                                              context, mobileController.text);
                                        } else {
                                          loginStore
                                              .loginScaffoldKey.currentState
                                              ?.showSnackBar(SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              'Please enter a phone number',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ));
                                        }
                                      },
                                      color: Color(0xff62b490),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(39))),
                                      child: Text(
                                        'บันทึกข้อมูล',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 12, 20, 12),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))));
    });
  }
}
