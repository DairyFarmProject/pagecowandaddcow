import 'package:finaldairy/Screens/Activity/Calve/editrecordclave.dart';
import 'package:finaldairy/Screens/Activity/Calve/recordcalve.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AllRecordCalve extends StatefulWidget {
  const AllRecordCalve({Key? key}) : super(key: key);

  @override
  _AllRecordCalveState createState() => _AllRecordCalveState();
}

class _AllRecordCalveState extends State<AllRecordCalve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('บันทึกการคลอด'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff5a82de),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
          child: SingleChildScrollView(
              child: Column(
            children: [
              ExpansionTile(
                collapsedBackgroundColor: Colors.blueGrey[100],
                tilePadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                title: Text(
                  'บุญมี - A122 กับ บุญรี - A123',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'วันที่',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'ผลการทำคลอด',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'ชื่อลูกวัว',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'หมายเหตุ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('12/2/63'),
                            Text('ปกติ'),
                            Text('มีมี้'),
                            Text('ไม่มีเลย')
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(100, 10, 100, 20),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditRecordCalve();
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
          )),
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
              return RecordCalve();
            }));
          },
        ));
  }
}
