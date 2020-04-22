import 'package:flutter/material.dart';
import 'package:offline_storage/pages/settings.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Settings(),
              ),
            ),
          ),
        ],
      ),
      body: null,
    );
  }
}
