import 'package:finaldairy/addcow1.dart';
import 'package:finaldairy/onecow.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Cow extends StatefulWidget {
  @override
  _CowState createState() => _CowState();
}

class Cows {
  int cow_id, typecow_id, species_id, farm_id, statuscow_id;
  String cow_no,
      cow_name,
      cow_birthday,
      cow_sex,
      cow_image1,
      cow_image2,
      cow_image3,
      note;
  Cows(
      this.cow_id,
      this.cow_no,
      this.cow_name,
      this.cow_birthday,
      this.cow_sex,
      this.cow_image1,
      this.cow_image2,
      this.cow_image3,
      this.note,
      this.typecow_id,
      this.species_id,
      this.farm_id,
      this.statuscow_id);
}

class _CowState extends State<Cow> {
  getCows() async {
    var response = await http.get(Uri.http('10.0.2.2:4000', 'cow'));
    var data = json.decode(response.body);
    List<Cows> cows = [];
    for (var u in data) {
      Cows cow = Cows(
          u['cow_id'],
          u['cow_no'],
          u['cow_name'],
          u['cow_birthday'],
          u['cow_sex'],
          u['cow_image1'],
          u['cow_image2'],
          u['cow_image3'],
          u['note'],
          u['typecow_id'],
          u['species_id'],
          u['farm_id'],
          u['statuscow_id']);
      cows.add(cow);
    }
    print(cows.length);
    return cows;
  }

  @override
  void initState() {
    super.initState();
    getCows();
  }

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
          titleTextStyle: TextStyle(fontWeight: FontWeight.w900),
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
              child: FutureBuilder(
                  future: getCows(),
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
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return Padding(
                                padding: const EdgeInsets.all(0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return OneCow();
                                      }));
                                    },
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Center(
                                          child: Card(
                                            elevation: 1,
                                            margin: EdgeInsets.only(top: 3),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        15)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Image.network(
                                                  snapshot.data[i].cow_image1 ??
                                                      "",
                                                  width: 180,
                                                  height: 150,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox.fromSize(
                                                    size: Size(100, 8)),
                                                Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(10, 0, 0, 12),
                                                    child: Text('${
                                                      snapshot.data[i]
                                                              .cow_name ?? ""}, ${snapshot.data[i].cow_no}',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          ),
                                                    )
                                                    ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ))));
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
