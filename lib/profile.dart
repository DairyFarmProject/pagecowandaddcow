import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
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
              'ตอบรับคำขอเข้าร่วม',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            margin: EdgeInsets.only(top: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                width: 375,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey[50],
                ),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          '/Users/prang/Documents/DairyCattle/finaldairy/assets/images/avartar_staff.jpeg'),
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("คุณลูกจ้าง1"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 10),
                      child: RaisedButton(
                        onPressed: () {},
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
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: RaisedButton(
                        onPressed: () {},
                        color: Color(0xff62b490),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(39))),
                        child: Text(
                          'ยืนยัน',
                          style: TextStyle(
                              color: Colors.blueGrey[50],
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
