import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int color = Colors.white.value;
  SharedPreferences prefs;
  @override
  initState() {
    super.initState();
    getColor();
  }

  saveColor(int color) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('c', color);
  }

  getColor() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      color = prefs.get('c') ?? Colors.white.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(color),
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RadioListTile(
              title: Text('Green'),
              value: Colors.green.value,
              groupValue: color,
              onChanged: (int newColor) {
                setState(() {
                  color = newColor;
                });
                saveColor(newColor);
              },
            ),
            RadioListTile(
              title: Text('Red'),
              value: Colors.red.value,
              groupValue: color,
              onChanged: (int newColor) {
                setState(() {
                  color = newColor;
                });
                saveColor(newColor);
              },
            ),
            RadioListTile(
              title: Text('Orange'),
              value: Colors.orange.value,
              groupValue: color,
              onChanged: (int newColor) {
                setState(() {
                  color = newColor;
                });
                saveColor(newColor);
              },
            )
          ],
        ),
      ),
    );
  }
}
