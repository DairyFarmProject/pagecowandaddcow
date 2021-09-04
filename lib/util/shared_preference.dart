import 'package:finaldairy/models/CheckEmail.dart';
import '../models/UserDairys.dart';
import 'package:finaldairy/models/Token.dart';
import '../models/User.dart';
import '../models/CheckEmail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(
      int user_id,
      String firstname,
      String lastname,
      String birthday,
      String mobile,
      String user_image,
      String email,
      String password,
      int worker_id,
      int role_id,
      int farm_id,
      String date_startwork,
      String date_endwork,
      String role_name,
      String farm_no,
      String farm_name,
      String farm_image,
      String address,
      int moo,
      String soi,
      String road,
      String sub_district,
      String district,
      String province,
      int postcode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("user_id", user_id);
    prefs.setString("lastname", lastname);
    prefs.setString("birthday", birthday);
    prefs.setString("mobile", mobile);
    prefs.setString("firstname", firstname);
    prefs.setString("user_image", user_image);
    prefs.setString("email", email);
    prefs.setString("password", password);
    prefs.setInt("worker_id", worker_id);
    prefs.setInt("role_id", role_id);
    prefs.setInt("farm_id", farm_id);
    prefs.setString("date_startwork", date_startwork);
    prefs.setString("date_endwork", date_endwork);
    prefs.setString("role_name", role_name);
    prefs.setString("farm_no", farm_no);
    prefs.setString("farm_name", farm_name);
    prefs.setString("farm_image", farm_image);
    prefs.setString("address", address);
    prefs.setInt("moo", moo);
    prefs.setString("soi", soi);
    prefs.setString("road", road);
    prefs.setString("sub_district", sub_district);
    prefs.setString("district", district);
    prefs.setString("province", province);
    prefs.setInt("postcode", postcode);

    print(password);

    return prefs.commit();
  }

  Future<bool> saveRegister(
      String user_id,
      String firstname,
      String lastname,
      String birthday,
      String mobile,
      String user_image,
      String email,
      String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("user_id", user_id);
    prefs.setString("lastname", lastname);
    prefs.setString("birthday", birthday);
    prefs.setString("mobile", mobile);
    prefs.setString("firstname", firstname);
    prefs.setString("user_image", user_image);
    prefs.setString("email", email);
    prefs.setString("password", password);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int user_id = prefs.getInt("user_id");
    String firstname = prefs.getString("firstname");
    String lastname = prefs.getString("lastname");
    String birthday = prefs.getString("birthday");
    String mobile = prefs.getString("mobile");
    String user_image = prefs.getString("user_image");
    String email = prefs.getString("email");
    String password = prefs.getString("password");
    int worker_id = prefs.getInt("worker_id");
    int role_id = prefs.getInt("role_id");
    int farm_id = prefs.getInt("farm_id");
    String date_startwork = prefs.getString("date_startwork");
    String date_endwork = prefs.getString("date_endwork");
    String role_name = prefs.getString("role_name");
    String farm_no = prefs.getString("farm_no");
    String farm_name = prefs.getString("farm_name");
    String farm_image = prefs.getString("farm_image");
    String address = prefs.getString("address");
    int moo = prefs.getInt("moo");
    String soi = prefs.getString("soi");
    String road = prefs.getString("road");
    String sub_district = prefs.getString("sub_district");
    String district = prefs.getString("district");
    String province = prefs.getString("province");
    int postcode = prefs.getInt("postcode");

    return User(
        user_id: user_id,
        firstname: firstname,
        lastname: lastname,
        birthday: birthday,
        mobile: mobile,
        user_image: user_image,
        email: email,
        password: password,
        worker_id: worker_id,
        role_id: role_id,
        farm_id: farm_id,
        date_startwork: date_startwork,
        date_endwork: date_endwork,
        role_name: role_name,
        farm_no: farm_no,
        farm_name: farm_name,
        farm_image: farm_image,
        address: address,
        moo: moo,
        soi: soi,
        road: road,
        sub_district: sub_district,
        district: district,
        province: province,
        postcode: postcode);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("firstname");
    prefs.remove("lastname");
    prefs.remove("birthday");
    prefs.remove("mobile");
    prefs.remove("user_image");
    prefs.remove("email");
    prefs.remove("password");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }

  Future<CheckEmail> getCheckEmail(
      String user_id, String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString("user_id");
    String email = prefs.getString("email");
    String password = prefs.getString("password");
    return CheckEmail(user_id: user_id, email: email, password: password);
  }

  Future<bool> setToken(Token token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token.token);

    print("object prefere");
    print(token.token);

    return prefs.commit();
  }
}
