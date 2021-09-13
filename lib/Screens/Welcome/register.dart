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

  CheckEmail? args;
  String? user_id;
  String? email;
  String? password;
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
  // final value_validator = RequiredValidator(errorText: "X Invalid");

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget._isInit) {
      args = ModalRoute.of(context)!.settings.arguments as CheckEmail;
      user_id = args!.user_id!;
      email = args!.email!;
      password = args!.password!;
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
                    //
                    ),
              ))));
    });
  }
}
