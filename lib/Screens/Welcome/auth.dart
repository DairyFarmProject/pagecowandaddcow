import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpException implements Exception {
  final message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}

class Auth with ChangeNotifier {

  int? _user_id;
  String? _firstname;
  String? _lastname;
  String? _birthday;
  String? _mobile;
  String? _user_image;
  String? _email;
  String? _password;

  int? get user_id {
    return _user_id;
  }

  String? get email {
    return _email;
  }

  Future<void> logout() async {
    _firstname = null;
    _lastname = null;
    _birthday = null;
    _mobile = null;
    _user_image = null;
    _email = null;
    _password = null;

    notifyListeners();

    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  Future<void> Authentication(String? email, String? password) async {
    try {
      final responce = await http.post(Uri.http('10.0.2.2:3000', 'login'),
          body: json.encode({
            'email': email,
            'password': password,
          }));

      final responceData = json.decode(responce.body);
      print(responceData);
      if (responceData['error'] != null) {
        throw HttpException(responceData['error']['message']);
      }

      _firstname = responceData['firstname'];
      _lastname = responceData['lastname'];
      _birthday = responceData['birthday'];
      _mobile = responceData['mobile'];
      _user_image = responceData['user_image'];
      _email = responceData['email'];
      _password = responceData['password'];

      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'firstname': _firstname,
        'lastname': _lastname,
        'birthday': _birthday,
        'mobile': _mobile,
        'user_image': _user_image,
        'email': _email,
        _password = responceData['password']: _password,
      });

      prefs.setString('userData', userData);

      print('check' + userData.toString());
    } catch (e) {
      throw e;
    }
  }

  Future<void> login(String? email, String? password) {
    return Authentication(email, password);
  }

  Future<void> signUp(String? email, String? password) {
    return Authentication(email, password);
  }
}
