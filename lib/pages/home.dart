import 'package:datapersistence/dbhelper.dart';
import 'package:datapersistence/model/course.dart';
import 'package:datapersistence/pages/coursedetails.dart';
import 'package:datapersistence/pages/courseupdate.dart';
import 'package:datapersistence/pages/newcourse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper helper;
  TextEditingController teSeach = TextEditingController();
  var allCourses = [];
  var items = List();


 @override
  void initState() {
    super.initState();
    helper = DbHelper();
    helper.allCourses().then((courses){
      setState(() {
        allCourses = courses;
        items = allCourses;
      });
    });
  }

  void filterSeach(String query) async{
   var dummySearchList = allCourses;
   if(query.isNotEmpty){
     var dummyListData = List();
     dummySearchList.forEach((item){
       var course = Course.fromMap(item);
       if(course.name.toLowerCase().contains(query.toLowerCase())){
         dummyListData.add(item);
       }
     });
     setState(() {
      items = [];
      items.addAll(dummyListData);
     });
     return;
   }else{
    setState(() {
      items = [];
      items = allCourses;
    });
   }
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onChanged: (value){
                setState(() {
                  filterSeach(value);
                });
              },
              controller: teSeach,
              decoration: InputDecoration(
                hintText: 'Search...',
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                )
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i){
                  Course course = Course.fromMap(items[i]);
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text('${course.name} - ${course.hours} hours - ${course.level}'),
                      subtitle: Text(course.content.substring(0,200)),
                      trailing:Column(
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CourseUpdate(course)));
                            },),

                          ),
                        ],
                      ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>CourseDetails(course)));
                      },
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
