import 'package:hive/hive.dart';

part 'todo_model.g.dart'; // Correct, if file is named note_model.dart

@HiveType(typeId: 0) // Unique typeId
class TodoModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;
  @HiveField(2)
  bool isFaverate;
  @HiveField(3)
  bool isComplete;
  @HiveField(4)
  bool isDelete;

  TodoModel({
    required this.title,
    required this.content,
    required this.isComplete,
    required this.isDelete,
    required this.isFaverate,
  });
  TodoModel copyWith({String? title, String? content, bool? isComplete, bool? isDelete , bool? isFaverate}){
    return TodoModel(title: title??this.title, content: content??this.content, isComplete: isComplete??this.isComplete, isDelete: isDelete??this.isDelete, isFaverate: isFaverate??this.isFaverate);
  }
}
