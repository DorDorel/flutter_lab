import 'package:flutter/material.dart';

class UiDemoHome extends StatefulWidget {
  const UiDemoHome({Key? key}) : super(key: key);

  @override
  _UiDemoHomeState createState() => _UiDemoHomeState();
}

class _UiDemoHomeState extends State<UiDemoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.kitesurfing_rounded,
              color: Colors.white,
            ),
          ),
        ],
        elevation: 1,
        title: Text(
          "UI DEMO FLOW",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Image.network(
                  "https://cdn.neow.in/news/images/uploaded/2021/04/1619644762_github-desktop_story.jpg"),
              Positioned(
                  child: Text(
                "gitHub ",
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
            ],
          )
        ],
      ),
    );
  }
}
