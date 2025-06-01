import 'package:hive/hive.dart';
part 'todo_model.g.dart'; 

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  String date;
  @HiveField(3)
  String time;
  @HiveField(4)
  bool favorite;
  @HiveField(5)
  bool deleted;
  @HiveField(6)
  bool completed;
  @HiveField(7)
  int edited;
  TodoModel({
    required this.title,
    required this.content,
    required this.date,
    required this.time,
    required this.favorite,
    required this.deleted,
    required this.completed,
    required this.edited,
  });
}
