import 'package:finaldairy/allrecordbreeding.dart';
import 'package:finaldairy/Screens/Cow/cow1.dart';
import 'package:finaldairy/Screens/Cow/onecow.dart';
import 'package:finaldairy/recordcalve.dart';
import 'package:finaldairy/recordmilk.dart';
import 'package:finaldairy/recordvaccine.dart';
import 'package:flutter/material.dart';

class AddActivity extends StatefulWidget {
  @override
  _AddActivityState createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  int _selectPage = 0;

  final _pageOptions = [
    OneCow,
    Cow(),
    AddActivity(),
    Navigator(),
    Navigator()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มกิจกรรม'),
        backgroundColor: Color(0xff62b490),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(),
            Expanded(
                child: GridView.count(
              padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 5,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RecordMilk();
                    }));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 2,
                    color: Colors.amber[600],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'บันทึกน้ำนมวัว',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size.fromHeight(0),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RecordVacine();
                    }));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 2,
                    color: Colors.teal[400],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text('บันทึกการฉีดวัคซีน',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AllRecordBreeding();
                    }));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 2,
                    color: Colors.red[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'บันทึกการผสมพันธ์',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RecordCalve();
                    }));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 2,
                    color: Colors.indigo[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'บันทึกการคลอด',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
