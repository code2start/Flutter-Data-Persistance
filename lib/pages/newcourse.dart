import 'package:flutter/material.dart';

class NewCourse extends StatefulWidget {
  @override
  _NewCourseState createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  String name, content;
  int hours;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Course'),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Course name'
                ),
                onChanged: (value){
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: 'Enter Course Content'
                ),
                onChanged: (value){
                  setState(() {
                    content = value;
                  });
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter Course hours'
                ),
                onChanged: (value){
                  setState(() {
                    hours = int.parse(value);
                  });
                },
              ),
              SizedBox(height: 15,),
              RaisedButton(
                child: Text('Save'),
                onPressed: (){

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
