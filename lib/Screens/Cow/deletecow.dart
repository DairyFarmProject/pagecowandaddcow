import 'package:dropdown_search/dropdown_search.dart';
import 'package:finaldairy/Screens/Cow/successdeletecow.dart';
import 'package:flutter/material.dart';

class DeleteCow extends StatefulWidget {
  @override
  _DeleteCowState createState() => _DeleteCowState();
}

class _DeleteCowState extends State<DeleteCow> {
  Widget optionCowButton() {
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
        title: Text("ลบวัว"),
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
            children: [
              Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(20),
                width: 350,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  border: Border.all(color: (Colors.blueGrey[800])!, width: 2),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: Text(
                                    'ชื่อวัว : มูมู้',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: Text(
                                    'วันเกิด : 11 ธันวาคม 2559',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                          child: Text(
                            'รหัสประจำตัว : A121',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff5a82de),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          'สถานะปัจจุบัน : โคท้อง',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ['เสียชีวิต', 'ขาย', 'อื่นๆ'],
                  label: 'สาเหตุการลบวัว',
                  hint: 'country in menu mode',
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: 'เสียชีวิต',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'รายละเอียดอื่นๆ',
                    fillColor: Colors.blueGrey,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //ignore: deprecated_member_use
                        RaisedButton(
                          onPressed: () {},
                          color: Colors.blueGrey[50],
                          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(39))),
                          child: Text(
                            'ยกเลิก',
                            style: TextStyle(
                              color: Color(0xffd6786e),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(
                      children: [
                        //ignore: deprecated_member_use
                        RaisedButton(
                          onPressed: () async {
                            final ConfirmAction? action =
                                await _asyncConfirmDialog(context);
                            print("Confirm Action $action");
                          },
                          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                          color: Color(0xff62b490),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(39)),
                          ),
                          child: Text(
                            'บันทึกข้อมูล',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ConfirmAction { Cancle, Accept }
Future<ConfirmAction?> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'ยืนยันที่จะลบวัวตัวนี้',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Container(
              width: 130,
              child: RaisedButton(
                child: const Text('ยกเลิก'),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                color: Color(0xffd6786e),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(39)),
                ),
                onPressed: () {
                  Navigator.of(context).pop(ConfirmAction.Cancle);
                },
              ),
            ),
            Container(
              width: 130,
              child: RaisedButton(
                child: const Text(
                  'ยืนยัน',
                  style: TextStyle(color: Colors.white),
                ),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                color: Color(0xff62b490),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(39)),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SuccessDeleteCow();
                  }));
                },
              ),
            ),
          ],
        );
      });
}
