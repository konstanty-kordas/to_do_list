import 'package:flutter/material.dart';


class MyIdeasList extends StatelessWidget {
  final List<String> myideas;
  MyIdeasList(this.myideas);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: myideas.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Text(myideas[index]),
            ),
          );
        },
      ),
    );
  }
}
