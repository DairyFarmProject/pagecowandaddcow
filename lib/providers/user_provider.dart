import 'package:flutter/foundation.dart';
import 'package:finaldairy/models/User.dart';

class UserProvider with ChangeNotifier {
  //late UserDairys _user;
  late User _user;

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
