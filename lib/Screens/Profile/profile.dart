import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text(
              'โปรไฟล์',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            margin: EdgeInsets.only(top: 10),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
            width: 420,
            height: 200,
            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blueGrey[50],
            ),
            child: Column(
              children: [
                Text('ชื่อ : สมปอง'),
                Text('นามสกุล : รักฟาร์มวัว'),
                Text('วันเกิด : 11 ธันวาคม 2530'),
                Text('เบอร์มือถือ : 092-222-2222'),
                Text('ID ผู้ใช้งาน : 1001010')
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
