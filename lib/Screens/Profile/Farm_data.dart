import 'package:finaldairy/Screens/Profile/accept_member.dart';
import 'package:finaldairy/Screens/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FarmData extends StatefulWidget {
  const FarmData({Key? key}) : super(key: key);
  @override
  _FarmDataState createState() => _FarmDataState();
}

class _FarmDataState extends State<FarmData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TabBar(
                          unselectedLabelColor: Colors.blueGrey[300],
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blueGrey[300]),
                          tabs: [
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Color(0xFFB0BEC5), width: 1)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ImageIcon(AssetImage(
                                      "assets/images/icon_farm.png")),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Color(0xFFB0BEC5), width: 1)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.person_add_alt_1_outlined),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Color(0xFFB0BEC5), width: 1)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.person_outline_sharp),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        height: 700, //height of TabBarView

                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: TabBarView(children: <Widget>[
                          Container(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          'โปรไฟล์',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        margin: EdgeInsets.only(top: 10),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(5, 10, 5, 0),
                                        width: 420,
                                        height: 200,
                                        padding:
                                            EdgeInsets.fromLTRB(30, 30, 30, 0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.blueGrey[50],
                                        ),
                                        child: Column(
                                          children: [
                                            Text('ชื่อฟาร์ม : มีชัยฟาร์ม'),
                                            Text('ตำแหน่ง : เจ้าของฟาร์ม'),
                                            Text(
                                                'เลขทะเบียนฟาร์ม : 123-929-102-0393'),
                                            Text(
                                                'ที่อยู่ฟาร์ม : 99/11	หนองมะค่า	โคกเจริญ ลพบุรี	15250'),
                                            Text('จำนวนวัวทั้งหมด : 20 ตัว')
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          AcceptMember(),
                          Profile(),
                        ]))
                    // Container(

                    //   margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    //   width: 40,
                    //   height: 200,
                    //   padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     color: Colors.blueGrey[50],
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Text('ชื่อฟาร์ม : มีชัยฟาร์ม'),
                    //       Text('ตำแหน่ง : เจ้าของฟาร์ม'),
                    //       Text('เลขทะเบียนฟาร์ม : 123-929-102-0393'),
                    //       Text(
                    //           'ที่อยู่ฟาร์ม : 99/11	หนองมะค่า	โคกเจริญ ลพบุรี	15250'),
                    //       Text('จำนวนวัวทั้งหมด : 20 ตัว')
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   child: Text('654564648964'),
                    // )
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
