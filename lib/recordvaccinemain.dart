import 'package:finaldairy/editrecordvaccine.dart';

import 'package:finaldairy/recordvaccinemainall.dart';
import 'package:finaldairy/ref.dart';
import 'package:flutter/material.dart';

class RecordVaccineMain extends StatefulWidget {
  const RecordVaccineMain({Key? key}) : super(key: key);

  @override
  _RecordVaccineMainState createState() => _RecordVaccineMainState();
}

class _RecordVaccineMainState extends State<RecordVaccineMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('บันทึกการฉีดวัคซีน'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff59aca9),
        ),
        body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                  Widget>[
            SizedBox(height: 20.0),
            DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TabBar(
                          unselectedLabelColor: Colors.red[900],
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.red[900]),
                          tabs: [
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.red[900]!, width: 1)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("รายตัว"),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.red[900]!, width: 1)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("รายฝูง"),
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
                                        ExpansionTile(
                                          collapsedBackgroundColor:
                                              Color(0xff59aca9),
                                          tilePadding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 0, 20, 0),
                                          title: Text(
                                            'มูมู้ A121',
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
                                                  'ชื่อวัคซีน',
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  'รอบการฉีด',
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  'วันที่',
                                                )),
                                              ],
                                              rows: <DataRow>[
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                      Text('มือปากเท้าเป่ือย')),
                                                  DataCell(Text('1/2564')),
                                                  DataCell(Text('2/2/2564')),
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                      Text('มือปากเท้าเป่ือย')),
                                                  DataCell(Text('2/2564')),
                                                  DataCell(Text('2/5/2564')),
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                      Text('มือปากเท้าเป่ือย')),
                                                  DataCell(Text('3/2564')),
                                                  DataCell(Text('2/8/2564')),
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
                                                    return EditRecordVaccine();
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
                            RecordVaccineMainAll(),
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
              return RecordVacine();
            }));
          },
        ));
  }
}
