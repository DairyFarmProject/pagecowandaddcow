import 'package:finaldairy/Screens/Farm/join_farm.dart';
import 'package:finaldairy/Screens/Profile/profile.dart';
import 'package:flutter/material.dart';

class JoinFarmWait extends StatefulWidget {
  const JoinFarmWait({Key? key}) : super(key: key);

  @override
  _JoinFarmWaitState createState() => _JoinFarmWaitState();
}

class _JoinFarmWaitState extends State<JoinFarmWait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                      ))),
            ),
            Center(
              child: Text('เข้าร่วมฟาร์ม'),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.account_circle, color: Colors.white, size: 30),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Profile();
                  }));
                },
              ),
            )),
          ],
        ),
        backgroundColor: Colors.green[400],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey[50],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'ส่งคำขอเข้าร่วม”มีชัย”ฟาร์มเรียบร้อยแล้ว',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Icon(
                    Icons.watch_later,
                    size: 62,
                    color: Colors.teal[700],
                  ),
                  Text('สถานะ : รองเจ้าของฟาร์มอนุมัติ')
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50, bottom: 30),
            child: Row(
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
                          return JoinFarm();
                        }));
                      },
                      color: Color(0xffd6786e),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(39))),
                      child: Text(
                        'ยกเลิกคำขอ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    )
                  ],
                )),
                Container(
                    child: Center(
                  child: Column(
                    children: [
                      // ignore: deprecated_member_use

                      RaisedButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('🎊🎊เข้าร่วมฟาร์มสำเร็จ🎊🎊'),
                            content: const Text(
                                'ขณะนี้เจ้าของฟาร์มได้อนุมัติคุณเป็นพนักงานในฟาร์มแล้ว'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Profile();
                                  }));
                                },
                                child: const Text('เข้าสู่หน้าหลัก',
                                    style: TextStyle(
                                      color: Colors.green,
                                    )),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'ปิด'),
                                child: const Text('ปิด',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                    )),
                              ),
                            ],
                          ),
                        ),

                        //() {

                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (context) {
                        //     return JoinFarmWait();
                        //   }));
                        // },
                        color: Color(0xff62b490),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(39))),
                        child: Text(
                          'รีเฟรช',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
