import 'package:finaldairy/dashboard.dart';
import 'package:finaldairy/notification.dart';
import 'package:finaldairy/profile.dart';
import 'package:flutter/material.dart';

import 'addactivity.dart';
import 'Screens/Cow/cow1.dart';
import 'Screens/Cow/onecow.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

int _selectIndex = 0;

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Text('ภาพรวม'),
    Text('วัวของฉัน'),
    Text('เพิ่มกิจกรรม'),
    Text('แจ้งเตือน'),
    Text('ฉัน'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectPage = 0;

  final _pageOptions = [
    Dashboard(),
    Cow(),
    AddActivity(),
    Notifications(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageOptions[_selectPage],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _selectPage = index;
            });
          },
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.blueGrey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: 'ภาพรวม',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'วัวของฉัน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_add),
              label: 'เพิ่มกิจกรรม',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'แจ้งเตือน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt),
              label: 'ฉัน',
            ),
          ],
          currentIndex: _selectPage,
        ));
  }
}
