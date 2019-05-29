import 'package:flutter/material.dart';

import 'package:to_do_list/adding_page.dart';

class AddNewIdeaButton extends StatefulWidget {
  AddNewIdeaButton();
  _AddNewIdeaButtonState createState() => _AddNewIdeaButtonState();
}

class _AddNewIdeaButtonState extends State<AddNewIdeaButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(30.0),
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddingPage()),
            );
          });
        },
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
