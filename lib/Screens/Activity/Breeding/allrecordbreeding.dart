import 'package:finaldairy/Screens/Activity/Breeding/editrecordbreed.dart';
import 'package:finaldairy/Screens/Activity/Breeding/recordbreeding.dart';
import 'package:flutter/material.dart';

class AllRecordBreeding extends StatefulWidget {
  @override
  _AllRecordBreedingState createState() => _AllRecordBreedingState();
}

class _AllRecordBreedingState extends State<AllRecordBreeding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("บันทึกการผสมพันธ์"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xffd6786e),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  collapsedBackgroundColor: Colors.blueGrey[200],
                  tilePadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  title: Text(
                    'บุญมี - A122 กับ บุญรี - A123',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  children: <Widget>[
                    Text(
                      'วันที่เริ่มผสม 11/12/63',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    DataTable(
                      columnSpacing: 10,
                      columns: <DataColumn>[
                        DataColumn(
                            label: Text(
                          'ชื่อกิจกรรม',
                        )),
                        DataColumn(
                            label: Text(
                          'วันที่',
                        )),
                        DataColumn(
                            label: Text(
                          'อีกกี่วัน',
                        )),
                      ],
                      rows: <DataRow>[
                        DataRow(cells: <DataCell>[
                          DataCell(Text('กลับสัด 1')),
                          DataCell(Text('4/1/64')),
                          DataCell(
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: Colors.red[800],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  )),
                              child: Text(
                                'อีก 2 วัน',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: <DataCell>[
                          DataCell(Text('กลับสัด 2')),
                          DataCell(Text('7/1/64')),
                          DataCell(
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: Colors.red[800],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  )),
                              child: Text(
                                'อีก 5 วัน',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: <DataCell>[
                          DataCell(Text('กลับสัด 3')),
                          DataCell(Text('12/1/64')),
                          DataCell(
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: Colors.red[800],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  )),
                              child: Text(
                                'อีก 10 วัน',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: <DataCell>[
                          DataCell(Text('ตรวจสอบการตั้งท้อง')),
                          DataCell(Text('13/1/64')),
                          DataCell(
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: Colors.red[800],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  )),
                              child: Text(
                                'อีก 11 วัน',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: <DataCell>[
                          DataCell(Text('พักท้อง')),
                          DataCell(Text('14/1/64')),
                          DataCell(
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: Colors.red[800],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  )),
                              child: Text(
                                'อีก 12 วัน',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: <DataCell>[
                          DataCell(Text('กำหนดคลอด')),
                          DataCell(Text('17/1/64')),
                          DataCell(
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  color: Colors.red[800],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  )),
                              child: Text(
                                'อีก 15 วัน',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ])
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(100, 10, 100, 20),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EditRecordBreed();
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
              return RecordBreeding();
            }));
          },
        ));
  }
}
