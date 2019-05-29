import 'package:flutter/material.dart';

import './input_idea.dart';

class AddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(child: InputIdea()),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
