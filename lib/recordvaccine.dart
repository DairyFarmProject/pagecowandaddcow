import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'successrecord.dart';

class RecordVacine extends StatefulWidget {
  @override
  _RecordVacineState createState() => _RecordVacineState();
}

class _RecordVacineState extends State<RecordVacine> {
  String v1 = 'มือปากเท้าเปื่อย';
  String v2 = 'ไข้ขา';
  String v3 = 'คอบวม';
  String v4 = 'กาลี';

  DateTime _dateTime;
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
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: DropdownSearch<String>(
                mode: Mode.MENU,
                showSelectedItem: true,
                items: [v1, v2, v3, v4],
                label: "ชื่อวัคซีน",
                hint: "country in menu mode",
                popupItemDisabled: (String s) => s.startsWith('I'),
                onChanged: print,
                selectedItem: v1),
            padding: const EdgeInsets.all(20.0),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(0),
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child:
                Text('วันที่', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 0, 20),
                child: Text(
                  _dateTime == null ? 'yyyy/mm/dd' : _dateTime.toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: IconButton(
                  icon: Icon(
                    Icons.calendar_today_sharp,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2022),
                    ).then((date) {
                      setState(() {
                        _dateTime = date;
                      });
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'รายละเอียดอื่นๆ',
                  fillColor: Colors.blueGrey,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                  )),
              onChanged: (String name) {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.blueGrey[50],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(39))),
                        child: Text(
                          'ยกเลิก',
                          style: TextStyle(
                              color: Color(0xffd6786e),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      )
                    ],
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
                  child: Column(
                    children: [
                      // ignore: deprecated_member_use

                      RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SuccessRecord();
                          }));
                        },
                        color: Color(0xff62b490),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(39))),
                        child: Text(
                          'บันทึกข้อมูล',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                      )
                    ],
                  )),
            ],
          ),
        ],
      )),
    );
  }
}
