import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'home.dart';
import '../../models/ScreenArguments.dart';
import 'text_field_container.dart';

class CreateFarm extends StatefulWidget {
  CreateFarm({Key? key}) : super(key: key);

  @override
  _CreateFarmState createState() => _CreateFarmState();
}

class _CreateFarmState extends State<CreateFarm> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final nameFarmController = TextEditingController();
  final numberFarmController = TextEditingController();
  final codeFarmController = TextEditingController();
  final addressFarmController = TextEditingController();
  final mooFarmController = TextEditingController();
  final soiFarmController = TextEditingController();
  final roadFarmController = TextEditingController();
  final sub_districtFarmController = TextEditingController();
  final districtFarmController = TextEditingController();
  final provinceFarmController = TextEditingController();
  final postcodeFarmController = TextEditingController();
  final value_validator = RequiredValidator(errorText: "X Invalid");

  File? _image;
  List<File> _images = [];
  DocumentReference sightingRef =
      FirebaseFirestore.instance.collection("Farm").doc();

  Future getImage(bool gallery) async {
    ImagePicker picker = ImagePicker();
    PickedFile pickedFile;
    if (gallery) {
      pickedFile = (await picker.getImage(
        source: ImageSource.gallery,
      ))!;
    } else {
      pickedFile = (await picker.getImage(
        source: ImageSource.camera,
      ))!;
    }

    setState(() {
      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

  Future saveImages(List<File> _images, DocumentReference ref) async {
    _images.forEach((image) async {
      String imageURL = await uploadFile(image);
      ref.update({
        "images": FieldValue.arrayUnion([imageURL])
      });
    });
  }

  Future uploadFile(File _image) async {
    FirebaseStorage storageReference = FirebaseStorage.instance;
    Reference ref =
        storageReference.ref().child('Farm/image' + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(_image);
    uploadTask.whenComplete(() async {
      String url = await ref.getDownloadURL();
    }).catchError((onError) {
      print(onError);
    });
  }

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
                    child: Text('??????????????????????????????',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25)),
                  ),
                  TextFieldContainer(
                      controller: nameFarmController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        '???????????????????????????',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "???????????????????????????"),
                  TextFieldContainer(
                      controller: numberFarmController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        '?????????????????????????????????????????????',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "?????????????????????????????????????????????"),
                  TextFieldContainer(
                      controller: codeFarmController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        '???????????????????????????',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "???????????????????????????"),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(0),
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text(
                          '????????????????????????????????????????????????',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.all(0),
                          padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                          child: RawMaterialButton(
                            fillColor: Colors.green[400],
                            child: Icon(
                              Icons.add_photo_alternate_rounded,
                              size: 30,
                              color: Colors.blueGrey,
                            ),
                            elevation: 8,
                            onPressed: () {
                              getImage(true);
                            },
                            padding: EdgeInsets.all(15),
                            shape: CircleBorder(),
                          )),
                    ],
                  ),
                  TextFieldContainer(
                      controller: addressFarmController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        '??????????????????????????????',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "??????????????????????????????"),
                  TextFieldContainer(
                      controller: mooFarmController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        '????????????',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "????????????"),
                  TextFieldContainer(
                      controller: soiFarmController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        '?????????',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "?????????"),
                  TextFieldContainer(
                      controller: roadFarmController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        '?????????',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "?????????"),
                  TextFieldContainer(
                      controller: sub_districtFarmController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        '????????????',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "????????????"),
                  TextFieldContainer(
                      controller: districtFarmController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        '???????????????',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "???????????????"),
                  TextFieldContainer(
                      controller: provinceFarmController,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        '?????????????????????',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "?????????????????????"),
                  TextFieldContainer(
                      controller: postcodeFarmController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                      validator: value_validator,
                      child: Text(
                        '????????????????????????????????????',
                        style: TextStyle(fontSize: 15),
                      ),
                      hintText: "????????????????????????????????????"),
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
                                  '??????????????????',
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
                                          farm_code: codeFarmController.text,
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
                                  '????????????????????????????????????',
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
