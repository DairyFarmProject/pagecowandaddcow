import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'models/User.dart';

class Dashboard extends StatefulWidget {
  // final User user;
  // Dashboard({Key? key, required this.user}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;
    return Center(
      child: Text(user.address),
    );
  }
}
