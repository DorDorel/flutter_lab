import 'dart:async';

import 'package:flutter/material.dart';

class Isdemo extends StatefulWidget {
  const Isdemo({Key? key}) : super(key: key);
  @override
  State<Isdemo> createState() => _IsdemoState();
}

class _IsdemoState extends State<Isdemo> {
  @override
  void initState() {
    AsyncsData.getNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("init state demo app"),
          actions: [
            IconButton(
                onPressed: () {
                  print("appbar button click!");
                },
                icon: Icon(
                  Icons.emoji_food_beverage_sharp,
                  color: Colors.white,
                ))
          ],
        ),
        body: TextButton(
          onPressed: () {
            print(AsyncsData.names);
          },
          child: Text("click"),
        ));
  }
}

class AsyncsData {
  static List<String> names = [];

  static List<String> getNames() {
    String a = "Dor";
    String b = "Luzgarten";
    String c = "Alice";
    String d = "Bob";

    Timer _timer = Timer(
        Duration(seconds: 5),
        () => {
              names.add(a),
              names.add(b),
              names.add(c),
              names.add(d),
              // print(names)
            });

    return names;
  }
}
