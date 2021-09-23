import 'dart:convert';

import 'package:finaldairy/Screens/Activity/Milk/editrecordmilk.dart';
import 'package:finaldairy/models/Milks.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'recordmilk.dart';
import 'recordmilkDay.dart';
import 'recordmilkYear.dart';

class RecordMilkYear extends StatefulWidget {
  const RecordMilkYear({Key? key}) : super(key: key);

  @override
  _RecordMilkYearState createState() => _RecordMilkYearState();
}

class _RecordMilkYearState extends State<RecordMilkYear> {
  DateTime? now = new DateTime.now();
  var formatter = new DateFormat.yMMMMd("th_TH");
  int? milks;

  Future<List<Milks>> getMilk() async {
    final response = await http.get(Uri.http('10.0.2.2:3000', 'milks'));

    Map<String, dynamic> data = jsonDecode(response.body);
    final List list = data['data']['rows'];

    List<Milks> typecows = list.map((e) => Milks.fromMap(e)).toList();

    return typecows;
  }

  Future getCount() async {
    final response = await http.get(Uri.http('10.0.2.2:3000', 'milks/year'));

    Map<String, dynamic> data = jsonDecode(response.body);
    int? milk = data['data']['milk'];

    setState(() {
      milks = milk;
    });

    return milk;
  }

  @override
  void initState() {
    super.initState();
    getMilk();
    getCount();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "จำนวนน้ำนมรวมภายในปีนี้",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Text('${milks}',
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
                  'มิถุนายน 2564',
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
                  'พฤษภาคม 2564',
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
                  'เมษายน 2564',
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
                        DataCell(Text('200')),
                        DataCell(Text('กิโลกรัม (20 ตัว)')),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('น้ำนมวัวรอบเย็น')),
                        DataCell(Text('200')),
                        DataCell(Text('กิโลกรัม (20 ตัว)')),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('รวม',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text('400',
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
                  'มีนาคม 2564',
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
