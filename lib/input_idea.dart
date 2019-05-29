import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputIdea extends StatefulWidget {
  _InputIdeaState createState() => _InputIdeaState();
}

class _InputIdeaState extends State<InputIdea> {
  final TextEditingController cleaningcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(20.0),
        child: TextField(
          onTap: () {
            setState(() {
              cleaningcontroller.text = '';
            });
          },
          autofocus: true,
          maxLength: 15,
          maxLengthEnforced: true,
          decoration: InputDecoration(
            hintText: "Pisz Tutaj!",
          ),
          onSubmitted: (String str) {
            setState(() {
              _addNewList(str);
            });
          },
          controller: cleaningcontroller,
        ),
      ),
    );
  }

  _addNewList(str) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> ideas = prefs.getStringList('idee') ?? [];
    str = str.trim();
    if (ideas.contains(str)) {
      cleaningcontroller.text = "Name already taken, try again";
    } else if (str.isEmpty) {
      cleaningcontroller.text = "Name can't be empty";
    } else {
      ideas.add(str);
      await prefs.setStringList('idee', ideas);
      Navigator.pop(context);
    }
  }
}
