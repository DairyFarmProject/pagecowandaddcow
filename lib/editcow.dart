import 'package:finaldairy/successeditcow.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class EditCow extends StatefulWidget {
  @override
  _EditCowState createState() => _EditCowState();
}

class _EditCowState extends State<EditCow> {
  late DateTime? _dateTime;

  final String name = 'มูมู้';
  final String birthday = '11 ธันวาคม 2559';
  final String code = 'A121';
  final String note = 'ไม่กินหญ้า';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แก้ไขข้อมูลวัว"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff62b490),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(20),
                width: 350,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  border: Border.all(color: Colors.blueGrey.shade800, width: 2),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: Text(
                                    'ชื่อวัว : $name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: Text(
                                    'วันเกิด : $birthday',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                          child: Text(
                            'รหัสประจำตัว : $code',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff5a82de),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          'สถานะปัจจุบัน : โคท้อง',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'ชื่อวัว',
                      hintText: '$name',
                      fillColor: Colors.blueGrey,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2),
                      )),
                  onChanged: (String name) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'รหัสประจำตัว',
                      hintText: '$code',
                      fillColor: Colors.blueGrey,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2),
                      )),
                  onChanged: (String name) {},
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.all(0),
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: Text('วันเกิด',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 0, 20),
                        child: Text(
                          _dateTime == null
                              ? '$birthday'
                              : _dateTime.toString(),
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
                ],
              ),
              Container(
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItem: true,
                    items: ["ป่วย", "สุขภาพดี", "ตาย"],
                    label: "สถานะวัว",
                    hint: "country in menu mode",
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: print,
                    selectedItem: "ป่วย"),
                padding: const EdgeInsets.all(20.0),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.all(0),
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: Text('รูปภาพวัว'),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(0),
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 30,
                        color: Colors.blueGrey,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'รายละเอียดอื่นๆ',
                      hintText: '$note',
                      fillColor: Colors.blueGrey,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2),
                      )),
                  onChanged: (String name) {},
                ),
              ),
              Container(
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItem: true,
                    items: [
                      "ลูกวัว",
                      "โคสาว",
                      "โคท้อง",
                      "โคแห้งนม",
                      "โคผสมพันธ์",
                      "โคแก่"
                    ],
                    label: "ประเภทวัว",
                    hint: "country in menu mode",
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: print,
                    selectedItem: "ลูกวัว"),
                padding: const EdgeInsets.all(20.0),
              ),
              Container(
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItem: true,
                    items: ["Thai Friesian", "Sahiwal", "Red Dane"],
                    label: "สายพันธ์วัว",
                    hint: "country in menu mode",
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: print,
                    selectedItem: "Sahiwal"),
                padding: const EdgeInsets.all(20.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
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
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Column(
                        children: [
                          // ignore: deprecated_member_use

                          RaisedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SuccessEditCow();
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
          ),
        ),
      ),
    );
  }
}
