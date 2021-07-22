import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finaldairy/Screens/Farm/background.dart';
import 'package:finaldairy/Screens/Welcome/rounded_button.dart';
import 'package:finaldairy/Screens/Farm/create_farm.dart';
import 'package:finaldairy/Screens/Farm/join_farm.dart';
import 'package:finaldairy/Screens/Welcome/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder<bool>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return Background(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "ยินดีต้อนรับเข้าสู่ Dairy Cattle 4.0",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(height: size.height * 0.05),
                        Image.asset(
                          "assets/images/cow2.png",
                          height: size.height * 0.3,
                        ),
                        SizedBox(height: size.height * 0.05),
                        RoundedButton(
                          text: "สร้างฟาร์มใหม่",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CreateFarm();
                                },
                              ),
                            );
                          },
                        ),
                        RoundedButton(
                          text: "เข้าร่วมฟาร์ม",
                          color: kPrimaryLightColor,
                          textColor: Colors.black,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return JoinFarm();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
