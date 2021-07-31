import 'Screens/Cow/successrecord.dart';
import 'package:flutter/material.dart';

class RecordMilk extends StatefulWidget {
  @override
  _RecordMilkState createState() => _RecordMilkState();
}

class _RecordMilkState extends State<RecordMilk> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  Color color = Colors.grey;
  String title = 'บันทึกแล้ว';

  void doAddition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);

      sum = num1 + num2;
    });
  }

  void doClear() {
    setState(() {
      t1.text = "0";
      t2.text = "0";
    });
  }

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
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const Icon(Icons.navigate_before, size: 24),
                      onPressed: () {}),
                  Text(
                    '21 มิถุนายน 2564',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                      icon: const Icon(
                        Icons.navigate_next,
                        size: 24,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'ช่วงเช้า',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('จำนวนน้ำนมวัว'),
                ),
                SizedBox(
                  width: 100,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        hintText: "0",
                      ),
                      controller: t1,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Text(
                    'ลิตร',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                TextButton(
                  child: Text('บันทึก',
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(10)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff62b490)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: doAddition,
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'ช่วงเย็น',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('จำนวนน้ำนมวัว'),
                ),
                SizedBox(
                  width: 100,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        hintText: "0",
                      ),
                      controller: t2,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Text(
                    'ลิตร',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                TextButton(
                  child: Text('บันทึก',
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(10)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff62b490)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: doAddition,
                  onLongPress: () {
                    TextButton(
                      child: Text('แก้ไข',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(10)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              (Colors.grey[400])!),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      onPressed: () {},
                    );
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              decoration: BoxDecoration(
                  color: Color(0xffd6786e),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text('จำนวนน้ำนมทั้งหมด $sum ลิตร',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
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
        ),
      ),
    );
  }
}
