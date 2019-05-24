import 'package:flutter/material.dart';

import './ideas_list.dart';

class InputIdea extends StatefulWidget {
  final List<String> ideas;
  InputIdea(this.ideas);
  _InputIdeaState createState() => _InputIdeaState();
}

class _InputIdeaState extends State<InputIdea> {
  final TextEditingController cleaningcontroller = TextEditingController();
  List<String> ideaslist;
  @override
  void initState() {
    ideaslist = widget.ideas;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.red,
          margin: EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(hintText: "Pisz Tutaj!"),
            onSubmitted: (String str) {
              setState(() {
                ideaslist.add(str);
              });
              cleaningcontroller.text = "";
            },
            controller: cleaningcontroller,
          ),
        ),
        MyIdeasList(ideaslist)
      ],
    );
  }
}
