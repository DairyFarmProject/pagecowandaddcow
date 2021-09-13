import 'package:finaldairy/Screens/Cow/cow1.dart';
import 'package:finaldairy/util/shared_preference.dart';
import 'package:flutter/foundation.dart';
import 'package:finaldairy/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:finaldairy/models/Cows.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

class UserProvider with ChangeNotifier {
  //late UserDairys _user;
  late User _user;
  late Cows _cow;

  User get user => _user;
  Cows get cow => _cow;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setCow(Cows cow) {
    _cow = cow;
  }

  Future<bool> isAlreadyAuthenticated() async {
    Map data = {'user_id' : user.user_id.toString()};
    bool ans = true;
    

    final response = await http.post(Uri.http('10.0.2.2:3000', 'checkFarm'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));
    
    if (response.statusCode == 200) {
      Map<String, dynamic> resposne = jsonDecode(response.body);
      Map<String, dynamic> user = resposne['data'];
      print(user['message']);
      
      if(user['message'] == 'A') {
        ans = false;
      } else if (user['message'] == 'B'){
        ans = true;
      }
    }

    return ans;
  }

  // Future<List<Cows>> getCows() async {
  //   print(user.farm_id);
  //   late List<Cows?> cow;
  // Map data = {'farm_id': user.farm_id.toString()};
  //   final response = await http.post(Uri.http('10.0.2.2:3000', 'getCowsByUser'),
  //   headers: {
  //         "Accept": "application/json",
  //         "Content-Type": "application/x-www-form-urlencoded"
  //       },
  //       body: data,
  //       encoding: Encoding.getByName("utf-8"));
  //   if (response.statusCode == 200) {
  //   Map<String, dynamic> db = jsonDecode(response.body);
  //   final List list = db['data'];
  //   List<Cows> cows = list.map((e) => Cows.fromMap(e)).toList();

  //   UserPreferences().saveCow(
  //     list[0]['cow_id'], 
  //     list[0]['typecow_id'], 
  //     list[0]['species_id'], 
  //     list[0]['farm_id'], 
  //     list[0]['statuscow_id'], 
  //     list[0]['cow_no'], 
  //     list[0]['cow_name'], 
  //     list[0]['cow_birthday'], 
  //     list[0]['cow_sex'], 
  //     list[0]['cow_image1'], 
  //     list[0]['cow_image2'], 
  //     list[0]['cow_image3'], 
  //     list[0]['note']);

  //     var result = {"cows": cows[0]};
  //     Cows? cow = result['cows'];
  //     //Provider.of<UserProvider>(context, listen: false).setCow(cow);
  // }
  //   return cow;
  // }
}
