import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGridScreen(),
    );
  }
}

class MyGridScreen extends StatefulWidget {
  MyGridScreen({Key key}) : super(key: key);

  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  int _selectIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Text('ภาพรวม'),
    Text('วัวของฉัน'),
    Text('เพิ่มกิจกรรม'),
    Text('แจ้งเตือน'),
    Text('ฉัน'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("วัวในฟาร์ม"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.white,
            ),
            onPressed: () {
              print('I want to sort'); // do something
            },
          )
        ],
        backgroundColor: Color(0xff62b490),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                  onChanged: (value) {},
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  )),
            ),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${items[index]}'),
                );
              },
            )),
            GridView.count(
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
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          'มูมู้',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
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
        child: const Icon(Icons.add_circle_outline_rounded),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
