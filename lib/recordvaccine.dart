import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'successrecord.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class RecordVacine extends StatefulWidget {
  @override
  _RecordVacineState createState() => _RecordVacineState();
}

class Vaccines {
  int vaccine_id;
  String vac_nameen, vac_nameth, detail;
  Vaccines(this.vaccine_id, this.vac_nameen, this.vac_nameth, this.detail);
}

class _RecordVacineState extends State<RecordVacine> {
  getVaccines() async {
    var response = await http.get(Uri.http('10.0.2.2:3000', 'vaccines'));
    var data = json.decode(response.body);
    List<Vaccines> vaccines = [];
    for (var u in data) {
      Vaccines vaccine = Vaccines(
          u['vaccine_id'], u['vac_nameen'], u['vac_nameth'], u['detail']);
      vaccines.add(vaccine);
    }
    print(vaccines.length);
    return vaccines;
  }



  @override
  void initState() {
    super.initState();
    getVaccines();
  }

  int _selectIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('บันทึกการฉีดวัคซีน'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff59aca9),
        ),
        body: Container(
            child: FutureBuilder(
          future: getVaccines(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            } else
              return Container(
                child: Column(
                  children: [
                    Container(
                        // child: DropdownButton<String>(
                        //     hint: Text('${snapshot.data[0].vac_nameth}'),
                        //     value: '${snapshot.data[0].vac_nameth}',
                        //     onChanged: (newValue) {
                        //       setState(() {
                        //         snapshot.data[0].vac_nameth = newValue;
                        //       });
                        //     },
                        //     items: snapshot.data.map((vaccine) =>
                        //       DropdownMenuItem<String>(
                        //           child: Text(vaccine.vac_nameth),
                        //           value: vaccine.vac_nameth)
                        //     ).toList()
                        //     )
                        // child: ListView.builder(
                        //     itemCount: snapshot.data.length,
                        //     itemBuilder: (context, i) {
                        //       return
                        //       DropdownSearch <String> (
                        //         mode: Mode.MENU,
                        //         showSelectedItem: true,
                        //         items: ['ไข้ขา'],
                        //         label: "ชื่อวัคซีน",
                        //         hint: "country in menu mode",
                        //         popupItemDisabled: (String s) =>
                        //         s.startsWith('I'),
                        //         onChanged: print,
                        //         selectedItem: 'ไข้ขา'
                        //         );
                            
                              
                             child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: DropdownSearch<String>(
                                      mode: Mode.MENU,
                                      showSelectedItem: true,
                                      items: [snapshot.data[0].vac_nameth],
                                      label: "ชื่อวัคซีน",
                                      hint: "country in menu mode",
                                      popupItemDisabled: (String s) =>
                                          s.startsWith('I'),
                                      onChanged: print,
                                      selectedItem:
                                          '${snapshot.data[0].vac_nameth}'),
                                  padding: const EdgeInsets.all(20.0)
                                  )
                        //     }
                        // )
                         ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(0),
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Text('วันที่',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
                          child: Text(
                            _dateTime == null
                                ? 'yyyy/mm/dd'
                                : _dateTime.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: IconButton(
                            icon: Icon(
                              Icons.calendar_today_sharp,
                              color: Colors.blueGrey,
                            ),
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1970),
                                      lastDate: DateTime(2022))
                                  .then((date) {
                                setState(() {
                                  _dateTime = date;
                                });
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RaisedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  color: Colors.blueGrey[50],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(39))),
                                  child: Text(
                                    'ยกเลิก',
                                    style: TextStyle(
                                        color: Color(0xffd6786e),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 10, 30, 10))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
                          child: Column(
                            children: [
                              RaisedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SuccessRecord();
                                    }));
                                  },
                                  color: Color(0xff62b490),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(39))),
                                  child: Text(
                                    'บันทึกข้อมูล',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 12, 20, 12))
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
          },
        )));
  }
}
