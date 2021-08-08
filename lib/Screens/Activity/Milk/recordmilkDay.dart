import 'dart:html';

import 'package:finaldairy/Screens/Activity/Milk/recordmilk.dart';
import 'package:finaldairy/Screens/Activity/Milk/recordmilkMonth.dart';
import 'package:finaldairy/Screens/Activity/Milk/recordmilkYear.dart';

import 'package:flutter/material.dart';

import 'package:finaldairy/Screens/Activity/Milk/editrecordmilk.dart';

class RecordMilkDay extends StatefulWidget {
  const RecordMilkDay({Key? key}) : super(key: key);

  @override
  _RecordMilkDayState createState() => _RecordMilkDayState();
}

class _RecordMilkDayState extends State<RecordMilkDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("บันทึกน้ำนมวัว",
              style: TextStyle(fontWeight: FontWeight.bold)),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.amber[600],
        ),
        body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                  Widget>[
            SizedBox(height: 20.0),
            DefaultTabController(
                length: 3, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TabBar(
                          unselectedLabelColor: Colors.red,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.red),
                          tabs: [
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.red, width: 1)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("วันนี้"),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.red, width: 1)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("เดือนนี้"),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.red, width: 1)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("ปีนี้"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 700, //height of TabBarView

                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            Container(
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text("จำนวนน้ำนมรวมภายในวันนี้"),
                                        Text('40'),
                                        Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: Text('กิโลกรัม')),
                                        ExpansionTile(
                                          initiallyExpanded: true,
                                          collapsedBackgroundColor:
                                              Color(0xff59aca9),
                                          tilePadding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 0, 20, 0),
                                          title: Text(
                                            'วันที่ 21 มิถุนายน 2564',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          children: <Widget>[
                                            DataTable(
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
                                                  DataCell(
                                                      Text('น้ำนมวัวรอบเช้า')),
                                                  DataCell(Text('20')),
                                                  DataCell(Text(
                                                      'กิโลกรัม (20 ตัว)')),
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                      Text('น้ำนมวัวรอบเย็น')),
                                                  DataCell(Text('20')),
                                                  DataCell(Text(
                                                      'กิโลกรัม (20 ตัว)')),
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(Text('รวม',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold))),
                                                  DataCell(Text('40',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .red[700]))),
                                                  DataCell(Text(
                                                      'กิโลกรัม (20 ตัว)',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold))),
                                                ]),
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  100, 10, 100, 20),
                                              child: RaisedButton(
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return EditRecordMilk();
                                                  }));
                                                },
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(Icons.edit),
                                                      Text('แก้ไข')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            RecordMilkMonth(),
                            RecordMilkYear(),
                          ]))
                    ])),
          ]),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text(
            ' เพิ่มการบันทึกข้อมูล',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w200, fontSize: 14),
          ),
          icon: Icon(Icons.add),
          backgroundColor: Color(0xff62b490),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RecordMilk();
            }));
          },
        ));
  }
}
