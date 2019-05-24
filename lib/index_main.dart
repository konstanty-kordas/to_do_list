import 'package:flutter/material.dart';

import './input_ideas.dart';


class IndexMain extends StatelessWidget {
  final List<String> _ideas = [];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InputIdea(_ideas),
    );
  }
}