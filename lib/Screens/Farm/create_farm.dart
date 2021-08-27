import 'package:flutter/material.dart';
import 'confirm_create_farm.dart';
import 'home.dart';
import 'ScreenArguments.dart';
import 'text_field_container.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CreateFarm extends StatefulWidget {
  CreateFarm({Key? key}) : super(key: key);

  @override
  _CreateFarmState createState() => _CreateFarmState();
}

class _CreateFarmState extends State<CreateFarm> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final nameFarmController = TextEditingController();
  final numberFarmController = TextEditingController();
  final addressFarmController = TextEditingController();
  final mooFarmController = TextEditingController();
  final soiFarmController = TextEditingController();
  final roadFarmController = TextEditingController();
  final sub_districtFarmController = TextEditingController();
  final districtFarmController = TextEditingController();
  final provinceFarmController = TextEditingController();
  final postcodeFarmController = TextEditingController();
  final value_validator = RequiredValidator(errorText: "X Invalid");

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
                child: Text('DairyCattle'),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon:
                      Icon(Icons.account_circle, color: Colors.white, size: 30),
                  onPressed: () {},
                ),
              )),
            ],
          ),
          backgroundColor: Colors.green[400],
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text('สร้างฟาร์ม',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25)),
                  ),
                  TextFieldContainer(
                      controller: nameFarmController,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        'ชื่อฟาร์ม',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "ชื่อฟาร์ม"),
                  TextFieldContainer(
                      controller: numberFarmController,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        'เลขทะเบียนฟาร์ม',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "เลขทะเบียนฟาร์ม"),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(0),
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text(
                          'เพิ่มรูปภาพฟาร์ม',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.all(0),
                          padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            size: 30,
                            color: Colors.blueGrey,
                          )),
                    ],
                  ),
                  TextFieldContainer(
                      controller: addressFarmController,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        'บ้านเลขที่',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "บ้านเลขที่"),
                  TextFieldContainer(
                      controller: mooFarmController,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        'หมู่',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "หมู่"),
                  TextFieldContainer(
                      controller: soiFarmController,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        'ซอย',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "ซอย"),
                  TextFieldContainer(
                      controller: roadFarmController,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        'ถนน',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "ถนน"),
                  TextFieldContainer(
                      controller: sub_districtFarmController,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        'ตำบล',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "ตำบล"),
                  TextFieldContainer(
                      controller: districtFarmController,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        'อำเภอ',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "อำเภอ"),
                  TextFieldContainer(
                      controller: provinceFarmController,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        'จังหวัด',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "จังหวัด"),
                  TextFieldContainer(
                      controller: postcodeFarmController,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        'รหัสไปรษณีย์',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "รหัสไปรษณีย์"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ignore: deprecated_member_use
                              RaisedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Home();
                                  }));
                                },
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
                                padding:
                                    const EdgeInsets.fromLTRB(30, 10, 30, 10),
                              )
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Column(
                            children: [
                              // ignore: deprecated_member_use
                              RaisedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushNamed(
                                        context, "/confirmCreateFarm",
                                        arguments: ScreenArguments(
                                          farm_name: nameFarmController.text,
                                          farm_no: numberFarmController.text,
                                          address: addressFarmController.text,
                                          moo: mooFarmController.text,
                                          soi: soiFarmController.text,
                                          road: roadFarmController.text,
                                          sub_district:
                                              sub_districtFarmController.text,
                                          district: districtFarmController.text,
                                          province: provinceFarmController.text,
                                          postcode: postcodeFarmController.text,
                                        ));
                                  }
                                },
                                color: Color(0xff62b490),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(39))),
                                child: Text(
                                  'บันทึกข้อมูล',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(20, 12, 20, 12),
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
