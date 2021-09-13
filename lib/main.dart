import 'package:finaldairy/Screens/Cow/cow1.dart';
import 'package:finaldairy/Screens/Welcome/login.dart';
import 'package:finaldairy/Screens/Welcome/otp.dart';
import 'package:finaldairy/Screens/Welcome/register.dart';
import 'package:finaldairy/Screens/Welcome/signup.dart';
import 'package:finaldairy/Screens/Welcome/welcome.dart';
import 'package:finaldairy/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'providers/auth.dart';
import 'providers/user_provider.dart';
import 'models/User.dart' as DairyUser;
import 'util/shared_preference.dart';
import 'util/register_store.dart';
import 'Screens/Farm/confirm_create_farm.dart';

//home

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<DairyUser.User> getUserData() => UserPreferences().getUser();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          Provider<RegisterStore>(create: (_) => RegisterStore()),
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
              RegisterScreen.routeName: (context) => RegisterScreen(),
              OTP.routeName: (context) => OTP(),
            },
            home: Welcome()));
  }
}
