import 'package:flutter/material.dart';

import './index_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Name in Progress'),
        ),
        body: IndexMain(),
      ),
      theme: ThemeData(
        primaryColor: Colors.red[300],
      ),
    );
  }
}



