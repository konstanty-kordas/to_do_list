import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyIdeasList extends StatefulWidget {
  _MyIdeasListState createState() => _MyIdeasListState();
}

class _MyIdeasListState extends State<MyIdeasList> {
  List<String> myideas;
  SharedPreferences sharedPreferences;
  List<String> savedideas;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      savedideas = sharedPreferences.getStringList('saved');
      myideas = sharedPreferences.getStringList('idee');
      if (savedideas == null) {
        savedideas = [];
        persistsaved(savedideas);
      }
      if (myideas == null) {
        myideas = [];
        persist(myideas);
      }
      setState(() {});
    });
  }

  void persistsaved(List<String> zapisane) {
    setState(() {
      savedideas = zapisane;
    });
    sharedPreferences.setStringList('saved', zapisane);
  }

  void persist(List<String> pomysly) {
    setState(() {
      myideas = pomysly;
    });
    sharedPreferences?.setStringList('idee', pomysly);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: myideas.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(myideas[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  Widget _buildRow(String idea) {
    bool alreadySaved = savedideas.contains(idea);
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1557431103-9e10a5279b1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
          border: Border.all(color: Colors.red),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            idea,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              shadows: <Shadow>[
                Shadow(color: Colors.lime[100], offset: Offset(1, 1)),
                Shadow(color: Colors.lime[100], offset: Offset(1, -1)),
                Shadow(color: Colors.lime[100], offset: Offset(-1, 1)),
                Shadow(color: Colors.lime[100], offset: Offset(-1, -1)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.done,
                  color: alreadySaved ? Colors.green : Colors.white,
                  size: 36.0,
                ),
                onPressed: () {
                  setState(() {
                    if (alreadySaved) {
                      _unsaveelement(idea);
                    } else {
                      _savenewelement(idea);
                    }
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 36.0,
                ),
                onPressed: () {
                  setState(() {
                    _deleteelement(idea);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  _savenewelement(str) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> ideas = prefs.getStringList('saved') ?? [];
    if (ideas.contains(str)) {
    } else {
      ideas.add(str);
    }
    print(ideas);
    await prefs.setStringList('saved', ideas);
  }

  _unsaveelement(str) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> ideas = prefs.getStringList('saved') ?? [];
    ideas.remove(str);
    print(ideas);
    await prefs.setStringList('saved', ideas);
  }

  _deleteelement(str) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> ideas = prefs.getStringList('idee');
    List<String> saved = prefs.getStringList('saved');
    ideas.remove(str);
    saved.remove(str);
    print(ideas);
    await prefs.setStringList('idee', ideas);
    await prefs.setStringList('saved', saved);
  }
}
