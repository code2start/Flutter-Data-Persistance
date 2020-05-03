import 'package:datapersistence/model/course.dart';
import 'package:flutter/material.dart';
class CourseDetails extends StatelessWidget {
  Course course;
  CourseDetails(this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Course Details'),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text(course.name, style: Theme.of(context).textTheme.headline,),
            SizedBox(height: 20,),
            Text(course.content, style: Theme.of(context).textTheme.body1,),
            SizedBox(height: 20,),
            Text(course.hours.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
