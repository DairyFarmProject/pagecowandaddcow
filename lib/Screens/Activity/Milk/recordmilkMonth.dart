import 'package:finaldairy/Screens/Activity/Milk/editrecordmilk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'recordmilk.dart';
import 'recordmilkDay.dart';
import 'recordmilkYear.dart';

class RecordMilkMonth extends StatefulWidget {
  @override
  _RecordMilkMonthState createState() => _RecordMilkMonthState();
}

class _RecordMilkMonthState extends State<RecordMilkMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "จำนวนน้ำนมรวมภายในเดือนนี้",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Text('900',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'กิโลกรัม',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  )),
              ExpansionTile(
                collapsedBackgroundColor: Colors.blueGrey[200],
                tilePadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text(
                  'วันที่ 21 มิถุนายน 2564',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                children: <Widget>[
                  DataTable(
                    columnSpacing: 20,
                    columns: <DataColumn>[
                      DataColumn(
                          label: Text(
                        'รอบ',
                      )),
                      DataColumn(
                          label: Text(
                        'จำนวน',
                      )),
                      DataColumn(
                          label: Text(
                        'หน่วย (จำนวนวัว)',
                      )),
                    ],
                    rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Text('น้ำนมวัวรอบเช้า')),
                        DataCell(Text('20')),
                        DataCell(Text('กิโลกรัม (20 ตัว)')),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('น้ำนมวัวรอบเย็น')),
                        DataCell(Text('20')),
                        DataCell(Text('กิโลกรัม (20 ตัว)')),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('รวม',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text('40',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red[700]))),
                        DataCell(Text('กิโลกรัม (20 ตัว)',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                      ]),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(100, 10, 100, 20),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditRecordMilk();
                        }));
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.edit), Text('แก้ไข')],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                collapsedBackgroundColor: Colors.blueGrey[100],
                tilePadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text(
                  'วันที่ 20 มิถุนายน 2564',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                children: <Widget>[
                  DataTable(
                    columnSpacing: 20,
                    columns: <DataColumn>[
                      DataColumn(
                          label: Text(
                        'รอบ',
                      )),
                      DataColumn(
                          label: Text(
                        'จำนวน',
                      )),
                      DataColumn(
                          label: Text(
                        'หน่วย (จำนวนวัว)',
                      )),
                    ],
                    rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Text('น้ำนมวัวรอบเช้า')),
                        DataCell(Text('20')),
                        DataCell(Text('กิโลกรัม (20 ตัว)')),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('น้ำนมวัวรอบเย็น')),
                        DataCell(Text('20')),
                        DataCell(Text('กิโลกรัม (20 ตัว)')),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('รวม',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text('40',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red[700]))),
                        DataCell(Text('กิโลกรัม (20 ตัว)',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                      ]),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(100, 10, 100, 20),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditRecordMilk();
                        }));
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.edit), Text('แก้ไข')],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                collapsedBackgroundColor: Colors.blueGrey[200],
                tilePadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text(
                  'วันที่ 19 มิถุนายน 2564',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                children: <Widget>[
                  DataTable(
                    columnSpacing: 20,
                    columns: <DataColumn>[
                      DataColumn(
                          label: Text(
                        'รอบ',
                      )),
                      DataColumn(
                          label: Text(
                        'จำนวน',
                      )),
                      DataColumn(
                          label: Text(
                        'หน่วย (จำนวนวัว)',
                      )),
                    ],
                    rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Text('น้ำนมวัวรอบเช้า')),
                        DataCell(Text('20')),
                        DataCell(Text('กิโลกรัม (20 ตัว)')),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('น้ำนมวัวรอบเย็น')),
                        DataCell(Text('20')),
                        DataCell(Text('กิโลกรัม (20 ตัว)')),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('รวม',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text('40',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red[700]))),
                        DataCell(Text('กิโลกรัม (20 ตัว)',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                      ]),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(100, 10, 100, 20),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditRecordMilk();
                        }));
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.edit), Text('แก้ไข')],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                collapsedBackgroundColor: Colors.blueGrey[100],
                tilePadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text(
                  'วันที่ 18 มิถุนายน 2564',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                children: <Widget>[
                  DataTable(
                    columnSpacing: 20,
                    columns: <DataColumn>[
                      DataColumn(
                          label: Text(
                        'รอบ',
                      )),
                      DataColumn(
                          label: Text(
                        'จำนวน',
                      )),
                      DataColumn(
                          label: Text(
                        'หน่วย (จำนวนวัว)',
                      )),
                    ],
                    rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Text('น้ำนมวัวรอบเช้า')),
                        DataCell(Text('20')),
                        DataCell(Text('กิโลกรัม (20 ตัว)')),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('น้ำนมวัวรอบเย็น')),
                        DataCell(Text('20')),
                        DataCell(Text('กิโลกรัม (20 ตัว)')),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('รวม',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text('40',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red[700]))),
                        DataCell(Text('กิโลกรัม (20 ตัว)',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                      ]),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(100, 10, 100, 20),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditRecordMilk();
                        }));
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.edit), Text('แก้ไข')],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
