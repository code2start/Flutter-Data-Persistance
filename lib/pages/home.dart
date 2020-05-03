import 'package:datapersistence/dbhelper.dart';
import 'package:datapersistence/model/course.dart';
import 'package:datapersistence/pages/coursedetails.dart';
import 'package:datapersistence/pages/newcourse.dart';
import 'package:datapersistence/pages/updatecourse.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper helper;



 @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

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
      body: FutureBuilder(
        future: helper.allCourses(),
        builder: (context, AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }else{
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i){
                  Course course = Course.fromMap(snapshot.data[i]);
                  return ListTile(
                    title: Text('${course.name} - ${course.hours} hours'),
                    subtitle: Text(course.content.substring(0,100)),
                    trailing: Column(
                      children: <Widget>[
                        Expanded(
                          child: IconButton(icon: Icon(Icons.delete, color: Colors.red,),onPressed: (){
                            setState(() {
                              helper.delete(course.id);
                            });
                          },),
                        ),
                        Expanded(
                          child: IconButton(icon: Icon(Icons.edit, color: Colors.green,),onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateCourse(course)));
                          },),
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetails(course)));
                    },
                  );
                }
            );
          }
        },
      ),
    );
  }
}
