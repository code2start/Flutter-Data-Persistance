class Course{
  //attributes = fields in table
  int _id;
  String _name;
  String _content;
  int _hours;
  String _level;
  Course(dynamic obj){
    _id = obj['id'];
    _name = obj['name'];
    _content = obj['content'];
    _hours = obj['hours'];
    _level = obj['level'];
  }
  Course.fromMap(Map<String,dynamic> data){
    _id = data['id'];
    _name = data['name'];
    _content = data['content'];
    _hours = data['hours'];
    _level = data['level'];
  }
  Map<String, dynamic> toMap() => {'id' : _id,'name' : _name,'content' : _content, 'hours' : _hours, 'level':_level};

  int get id => _id;
  String get name => _name;
  String get content => _content;
  int get hours => _hours;
  String get level => _level;
}