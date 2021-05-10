import 'package:flutter/material.dart';

class MyGridScreen extends StatefulWidget {
  MyGridScreen({Key key}) : super(key: key);

  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
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
          title: Text("วัวในฟาร์ม"),
          actions: [
            PopupMenuButton<String>(
              offset: Offset(100, 38),
              icon: Icon(Icons.sort),
              onSelected: (select) => print('hi'),
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
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(20, (index) {
            return new Card(
              elevation: 10,
              margin: EdgeInsets.all(6),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15)),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Image.network(
                    "https://media.4-paws.org/3/e/5/6/3e56785d2a08c27be3ca72082c20fd0a4545586d/VIER%20PFOTEN_2015-04-27_010-1927x1333-1920x1328.jpg",
                    height: 150,
                    width: 200,
                    fit: BoxFit.scaleDown,
                  ),
                  new SizedBox(
                    height: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: new Text(
                      'มูมู้',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.blueGrey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: 'ภาพรวม',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'วัวของฉัน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_add),
              label: 'เพิ่มกิจกรรม',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'แจ้งเตือน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt),
              label: 'ฉัน',
            ),
          ],
          currentIndex: _selectIndex,
          onTap: _onItemTap,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add_circle_outline_rounded,
            color: Colors.white,
            size: 40,
          ),
          backgroundColor: Color(0xff62b490),
        ));
  }
}
