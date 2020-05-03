import 'package:datapersistence/dbhelper.dart';
import 'package:datapersistence/model/course.dart';
import 'package:flutter/material.dart';

class UpdateCourse extends StatefulWidget {
  Course course;
  UpdateCourse(this.course);


  @override
  _UpdateCourseState createState() => _UpdateCourseState();
}

class _UpdateCourseState extends State<UpdateCourse> {
  TextEditingController teName = TextEditingController();
  TextEditingController teContent = TextEditingController();
  TextEditingController teHours = TextEditingController();
  DbHelper helper;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
    teName.text = widget.course.name;
    teContent.text = widget.course.content;
    teHours.text = widget.course.hours.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Course'),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            TextField(controller: teName,),
            TextField(maxLines: null,controller: teContent,),
            TextField(controller: teHours,),
            RaisedButton(child: Text('Save'),onPressed: (){
              var updatedCourse = Course({
                'id': widget.course.id,
                'name': teName.text,
                'content':teContent.text,
                'hours' : int.parse(teHours.text),
              });
              helper.updateCourse(updatedCourse);
              Navigator.of(context).pop();
            },),
          ],
        ),
        ),

    );
  }
}
