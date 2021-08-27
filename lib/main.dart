import 'package:finaldairy/dashboard.dart';
import 'package:finaldairy/models/Token.dart';
import 'package:flutter/material.dart';

import 'Screens/Activity/addactivity.dart';
import 'package:finaldairy/Screens/Cow/addcow1.dart';
import 'package:finaldairy/Screens/Cow/cow1.dart';
import 'package:finaldairy/models/User.dart';
import 'package:finaldairy/models/User.dart';
import 'package:finaldairy/navigator.dart';
import 'package:finaldairy/Screens/Cow/onecow.dart';
// import 'package:finaldairy/recordbreeding.dart';
// import 'package:finaldairy/recordcalve.dart';
import 'package:finaldairy/recordvaccine.dart';
import 'package:flutter/material.dart';
import 'Screens/Cow/cow1.dart';
import 'Screens/Cow/addcow1.dart';
import 'Screens/Cow/onecow.dart';
import 'Screens/Cow/deletecow.dart';
import 'Screens/Cow/successdeletecow.dart';
import 'Screens/Cow/editcow.dart';
import 'Screens/Cow/historycow.dart';
import 'Screens/Farm/home.dart';
import 'Screens/Farm/create_farm.dart';
// import 'addactivity.dart';
// import 'recordmilk.dart';
import 'Screens/Farm/confirm_create_farm.dart';
// import 'allrecordbreeding.dart';
import 'package:provider/provider.dart';
import 'util/shared_preference.dart';
import 'providers/auth.dart';
import 'providers/user_provider.dart';
import 'Screens/Welcome/login.dart';
import 'package:finaldairy/Screens/Welcome/Welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          Provider<AuthProvider>(create: (_) => AuthProvider()),
          // Provider<UserProvider>(create: (_) => UserProvider()),
          ChangeNotifierProxyProvider<UserProvider, AuthProvider>(
            create: (_) => AuthProvider(),
            update:
                (_, UserProvider userProvider, AuthProvider? authProvider) =>
                    AuthProvider(),
          ),
        ],
        child: MaterialApp(
            theme: ThemeData(fontFamily: 'Mitr'),
            routes: {
              ConfirmCreateFarm.routeName: (context) => ConfirmCreateFarm(),
            },
            home: LoginScreen()));
  }
}
