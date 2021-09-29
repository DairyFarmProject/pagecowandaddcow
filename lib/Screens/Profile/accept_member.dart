import 'dart:convert';

import 'package:finaldairy/models/JoinFarm.dart';
import 'package:finaldairy/models/User.dart';
import 'package:finaldairy/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AcceptMember extends StatefulWidget {
  @override
  _AcceptMemberState createState() => _AcceptMemberState();
}

class _AcceptMemberState extends State<AcceptMember> {
  Future<List<JoinFarm>> getJoinFarm() async {
    final response = await http.get(Uri.http('10.0.2.2:3000', 'manage'));

    Map<String, dynamic> data = jsonDecode(response.body);
    final List list = data['data'];

    List<JoinFarm> typecows = list.map((e) => JoinFarm.fromMap(e)).toList();

    return typecows;
  }

  @override
  void initState() {
    super.initState();
    getJoinFarm();
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
        body: Container(
            margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'ตอบรับคำขอเข้าร่วม',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    margin: EdgeInsets.only(top: 10),
                  ),
                  Container(
                      child: FutureBuilder<List<JoinFarm>>(
                          future: getJoinFarm(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return Container(
                                child: Center(
                                  child: Text('Loading...'),
                                ),
                              );
                            } else
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, i) {
                                    return Container(
                                        child: SingleChildScrollView(
                                            child: Card(
                                                child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 20, 0, 20),
                                              child: Text(
                                                  "${snapshot.data?[i].firstname}"),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 20, 10, 20),
                                              child: RaisedButton(
                                                onPressed: () {},
                                                color: Colors.blueGrey[50],
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                39))),
                                                child: Text(
                                                  'ยกเลิก',
                                                  style: TextStyle(
                                                      color: Color(0xffd6786e),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14),
                                                ),
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 10, 20, 10),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              child: RaisedButton(
                                                onPressed: () =>
                                                    showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title: const Text(
                                                        'คุณ... ได้เข้าร่วมฟาร์มของคุณแล้ว'),
                                                    //content: const Text('AlertDialog description'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context, 'OK'),
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                color: Color(0xff62b490),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                39))),
                                                child: Text(
                                                  'ยืนยัน',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blueGrey[50],
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14),
                                                ),
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 10, 20, 10),
                                              ),
                                            )
                                          ],
                                        ))
                                      ],
                                    ))));
                                  });
                          }))
                ],
              ),
            )));
  }
}
