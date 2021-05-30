import 'package:finaldairy/deletecow.dart';
import 'package:finaldairy/editcow.dart';
import 'package:finaldairy/historycow.dart';
import 'package:flutter/material.dart';

class OneCow extends StatefulWidget {
  @override
  _OneCowState createState() => _OneCowState();
}

class _OneCowState extends State<OneCow> {
  @override
  Widget OneCow() {
    return IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {
        print("you want to edit or delete");
      },
    );
  }

  final String name = 'มูมู้';
  final String birthday = '11 ธันวาคม 2559';
  final String code = 'A121';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$name , $code"),
        actions: [
          PopupMenuButton(
            itemBuilder: (content) => [
              PopupMenuItem(
                value: 1,
                child: Text('แก้ไขข้อมูลวัว'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('ลบวัว'),
              ),
            ],
            onSelected: (int menu) {
              print(menu);
              if (menu == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditCow()));
              } else if (menu == 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeleteCow()));
              }
            },
          )
        ],
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
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
              margin: EdgeInsets.all(20),
              width: 318,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: FittedBox(
                  child: Image.network(
                      "https://media.4-paws.org/3/e/5/6/3e56785d2a08c27be3ca72082c20fd0a4545586d/VIER%20PFOTEN_2015-04-27_010-1927x1333-1920x1328.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Text('ข้อมูลวัว',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                      child: Text(
                        'ชื่อวัว : มูมู้',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                              child: Text('วันเกิด : 11 ธันวาคม 2559',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold))))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Container(
                alignment: FractionalOffset.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    'รหัสประจำตัว : A121',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        'พ่อพันธ์ : CX101',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                          alignment: FractionalOffset.bottomLeft,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text('แม่พันธ์ : C101 - บัวแก้ว ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold))))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Container(
                alignment: FractionalOffset.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    'สายพันธ์ : บางกอก',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 20),
              child: Container(
                alignment: FractionalOffset.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    'รายละเอียดอื่นๆ : แข็งแรงเหมาะเป็นแม่พันธ์',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            ExpansionTile(
              collapsedBackgroundColor: Colors.yellow[600],
              tilePadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              title: Text(
                'เหตุการณ์ที่กำลังจะเกิดขึ้น',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              children: <Widget>[
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white70,
                        child: Container(
                          height: 80,
                          width: 355,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            color: Colors.red[50],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('วันดรายนม'),
                                Text('4 ม.ค. 2558'),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.red[800],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2),
                                      )),
                                  child: Text(
                                    'อีก 2 วัน',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white70,
                        child: Container(
                          height: 80,
                          width: 355,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            color: Colors.red[50],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('วันดรายนม'),
                                Text('4 ม.ค. 2558'),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.red[800],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2),
                                      )),
                                  child: Text(
                                    'อีก 2 วัน',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
            // ExpansionTile(
            //   tilePadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            //   collapsedBackgroundColor: Color(0xffd6786e),
            //   //childrenPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            //   title: Text(
            //     'เหตุการณ์ที่กำลังจะเกิดขึ้น',
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 14),
            //   ),
            //   children: [
            //     Container(
            //       color: Color(0xffd6786e),
            //       child: Container(
            //         height: 80,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.only(
            //                 topRight: Radius.circular(20),
            //                 topLeft: Radius.circular(20))),
            //         child: Container(
            //           padding: EdgeInsets.all(10),
            //           color: Colors.white70,
            //           child: Row(
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: <Widget>[
            //                   Text('วันดรายนม'),
            //                   Text('4 ม.ค. 2558'),
            //                   Container(
            //                     padding: EdgeInsets.all(5),
            //                     decoration: BoxDecoration(
            //                         color: Colors.red[800],
            //                         borderRadius: BorderRadius.all(
            //                           Radius.circular(2),
            //                         )),
            //                     child: Text(
            //                       'อีก 2 วัน',
            //                       style: TextStyle(
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: <Widget>[
            //                   Text('วันดรายนม'),
            //                   Text('4 ม.ค. 2558'),
            //                   Container(
            //                     padding: EdgeInsets.all(5),
            //                     decoration: BoxDecoration(
            //                         color: Colors.red[800],
            //                         borderRadius: BorderRadius.all(
            //                           Radius.circular(2),
            //                         )),
            //                     child: Text(
            //                       'อีก 2 วัน',
            //                       style: TextStyle(
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 20),
                child: Column(
                  children: [
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HistoryCow();
                        }));
                      },
                      color: Color(0xff6d78e1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(39))),
                      child: Text(
                        'ดูประวัติ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      padding: const EdgeInsets.fromLTRB(40, 12, 40, 12),
                    )
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
