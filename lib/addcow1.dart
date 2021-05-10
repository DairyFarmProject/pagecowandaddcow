import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class AddCow extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGridScreen(),
    );
  }
}

class MyGridScreen extends StatefulWidget {
  MyGridScreen({Key key}) : super(key: key);

  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เพิ่มวัว"),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff62b490),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              decoration: BoxDecoration(
                  color: Color(0xff5a82de),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text('ส่วนที่ 1 : กรอกข้อมูลพื้นฐานของวัว',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'ชื่อวัว',
                    fillColor: Colors.blueGrey,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                    )),
                onChanged: (String name) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Tagวัว',
                    fillColor: Colors.blueGrey,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                    )),
                onChanged: (String name) {},
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 20),
                  child: Text(
                    _dateTime == null ? 'วันเกิด' : _dateTime.toString(),
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
                    fillColor: Colors.blueGrey,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 2),
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
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              decoration: BoxDecoration(
                  color: Color(0xff5a82de),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text('ส่วนที่ 2 : กรอกข้อมูลเฉพาะของวัว',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
            Container(
              child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ["เพศผู้", "เพศเมีย"],
                  label: "เพศ",
                  hint: "country in menu mode",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: "เพศผู้"),
              padding: const EdgeInsets.all(20.0),
            ),
            Container(
              child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ["บุญเก่ง", "บุุญว้าว"],
                  label: "ชื่อพ่อพันธ์",
                  hint: "country in menu mode",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: "บุญเก่ง"),
              padding: const EdgeInsets.all(20.0),
            ),
            Container(
              child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ["บูญมี", "บุญจัง", "บุญคง", "บุญปาน", "บุญงาน"],
                  label: "ชื่อแม่พันธ์",
                  hint: "country in menu mode",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: "บุญเก่ง"),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.blueGrey[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(39))),
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
                    child: Column(
                  children: [
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {},
                      color: Color(0xff62b490),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(39))),
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
    );
  }
}
