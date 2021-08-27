import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';
import 'providers/user_provider.dart';
import 'models/User.dart';
import 'util/shared_preference.dart';
import 'Screens/Farm/confirm_create_farm.dart';

//home
import 'Screens/Welcome/welcome.dart';

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
            home: Welcome()));
  }
}

