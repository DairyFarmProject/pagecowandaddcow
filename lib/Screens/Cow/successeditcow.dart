import 'package:finaldairy/Screens/Cow/cow1.dart';
import 'package:finaldairy/navigator.dart';
import 'package:flutter/material.dart';

class SuccessEditCow extends StatefulWidget {
  @override
  _SuccessEditCowState createState() => _SuccessEditCowState();
}

class _SuccessEditCowState extends State<SuccessEditCow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แก้ไขข้อมูลวัว"),
          leading: GestureDetector(
            onTap: () {},
          ),
          backgroundColor: Color(0xff62b490),
        ),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 40),
            child: Icon(
              Icons.check_circle,
              color: Color(0xff62b490),
              size: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Container(
              alignment: FractionalOffset.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  'แก้ไขข้อมูลวัวสำเร็จ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Homepage();
                      }));
                    },
                    color: Colors.blueGrey[50],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(39))),
                    child: Text(
                      'กลับหน้าแรก',
                      style: TextStyle(
                          color: Color(0xff59aca9),
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  )
                ],
              )),
              Container(
                  child: Column(
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Cow();
                      }));
                    },
                    color: Color(0xff59aca9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(39))),
                    child: Text(
                      'ดูวัวทั้งหมด',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  )
                ],
              )),
            ],
          ),
        ]));
  }
}
