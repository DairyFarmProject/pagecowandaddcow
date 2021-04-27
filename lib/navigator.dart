import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Tutorial'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectIndex,
        onTap: _onItemTap,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_circle_outline_rounded),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
