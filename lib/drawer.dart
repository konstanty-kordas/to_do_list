import 'package:flutter/material.dart';

import './main.dart';

class MySideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent[100],
            ),
            accountEmail: Text('k@k.k'),
            accountName: Text('ja'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1556229040-2a7bc8a00a3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
            ),
          ),
          ListTile(
            title: Text('1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
          ListTile(
            title: Text('2'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScreenTwo()),
              );
            },
          ),
        ],
      ),
    );
  }
}