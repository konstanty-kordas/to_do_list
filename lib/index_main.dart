import 'package:flutter/material.dart';


import './ideas_list.dart';
import './new_idea_button.dart';
// import './drawer.dart';

class IndexMain extends StatefulWidget {
  _IndexMainState createState() => _IndexMainState();
}

class _IndexMainState extends State<IndexMain> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MySideDrawer(),
      appBar: AppBar(
        title: Text('Name in Progress'),
      ),
      body: Stack(
        children: <Widget>[
          MyIdeasList(),
          Align(
            alignment: Alignment.bottomCenter,
            child: AddNewIdeaButton(),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
