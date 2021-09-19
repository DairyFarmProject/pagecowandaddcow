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
  Future<List<Cows>> getCow() async {
    User user = Provider.of<UserProvider>(context, listen: false).user;
    late List<Cows> cows;
    Map data = {'farm_id': user.farm_id.toString()};
    final response =
        await http.post(Uri.http('127.0.0.1:3000', 'getCowsByUser'),
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/x-www-form-urlencoded"
            },
            body: data,
            encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200) {
      Map<String, dynamic> db = jsonDecode(response.body);
      final List list = db['data']['cows'];
      cows = list.map((e) => Cows.fromMap(e)).toList();
    }
    return cows;
  }

  @override
  _CowState createState() => _CowState();

  void initState() {
    super.initState();
    getCow();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          child: FutureBuilder<List<Cows>>(
              future: getCow(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text('Loading...'),
                    ),
                  );
                } else
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                  margin: EdgeInsets.only(top: 5),
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
                                          snapshot.data?[i].cow_image1 ?? "",
                                          width: 180,
                                          height: 140,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox.fromSize(size: Size(100, 8)),
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
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
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
