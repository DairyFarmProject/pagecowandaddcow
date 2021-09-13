import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'addcow1.dart';
import 'package:finaldairy/models/Cows.dart';
import 'package:finaldairy/models/User.dart';
import 'package:finaldairy/providers/user_provider.dart';
import '../../util/shared_preference.dart';
import 'onecow.dart';

class Cow extends StatefulWidget {
  @override
  _CowState createState() => _CowState();
}

class _CowState extends State<Cow> {
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<UserProvider>(context, listen: false)
  //       .getCows()
  //       .whenComplete(() {
  //     setState(() {});
  //   });
  // }

  int _selectIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w700),
          title: Text("วัวในฟาร์ม"),
          actions: [
            PopupMenuButton<String>(
              offset: Offset(100, 38),
              icon: Icon(Icons.sort),
              itemBuilder: (BuildContext context) {
                return {'อายุ : มาก - น้อย', 'อายุ : น้อย - มาก', 'ประเภทวัว'}
                    .map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
          backgroundColor: Color(0xff62b490),
        ),
        body: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              child: FutureBuilder<List<Cows>>(
                  // future: UserProvider().getCows(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: Text('Loading...'),
                        ),
                      );
                    } else
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, i) {
                            return Padding(
                                padding: const EdgeInsets.all(0),
                                child: Center(
                                    child: Column(
                                  children: [
                                    Center(
                                        child: Card(
                                      elevation: 1,
                                      margin: EdgeInsets.only(top: 3),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(15)),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => OneCow(
                                                      cow: snapshot.data![i])));
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Image.network(
                                              snapshot.data?[i].cow_image1 ??
                                                  "",
                                              width: 180,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox.fromSize(
                                                size: Size(100, 8)),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 0, 12),
                                                child: Text(
                                                  '${snapshot.data?[i].cow_name ?? ""}, ${snapshot.data?[i].cow_no}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ))
                                  ],
                                )));
                          });
                  }),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddCow();
            }));
          },
          child: const Icon(
            Icons.add_circle_outline_rounded,
            color: Colors.white,
            size: 40,
          ),
          backgroundColor: Color(0xff62b490),
        ));
  }
}
