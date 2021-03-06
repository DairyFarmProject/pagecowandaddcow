import 'package:finaldairy/Screens/Activity/Breeding/allrecordbreeding.dart';
import 'package:finaldairy/Screens/Activity/Milk/recordmilkDay.dart';
import 'package:finaldairy/Screens/Cow/cow1.dart';
import 'package:finaldairy/Screens/Cow/onecow.dart';
import 'package:finaldairy/Screens/Activity/Calve/allrecordcalve.dart';

import 'package:finaldairy/recordvaccine.dart';
import 'package:finaldairy/recordvaccinemain.dart';
import 'package:finaldairy/recordvaccinemainall.dart';
import 'package:flutter/material.dart';

class AddActivity extends StatefulWidget {
  @override
  _AddActivityState createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  int _selectPage = 0;

  final _pageOptions = [OneCow, Cow(), AddActivity(), Navigator(), Navigator()];

  void _onItemTap(int index) {
    setState(() {
      _selectPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      return RecordMilkDay();
                    }));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 2,
                    color: Colors.amber[500],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            '??????????????????????????????????????????',
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
                      return RecordVaccineMain();
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
                          child: Text('??????????????????????????????????????????????????????',
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
                          '???????????????????????????????????????????????????',
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
                      return AllRecordCalve();
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
                          '???????????????????????????????????????',
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
