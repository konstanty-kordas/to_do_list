import 'package:flutter/material.dart';

import './index_main.dart';
import './drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: IndexMain(),
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        backgroundColor: Colors.lightBlue[100],
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MySideDrawer(),
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Container(
        child: Text("data"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
