import 'package:datapersistence/pages/newcourse.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Database'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewCourse())),
          )
        ],
      ),
      body: null,
    );
  }
}
