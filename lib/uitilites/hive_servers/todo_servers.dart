import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/constant/hive_constants.dart';
import 'package:todo/models/todo_model.dart';

class TodoServers {
  Box<TodoModel>? _box;  // Nullable box, initialize later  
  static final TodoServers _instance = TodoServers._internal();
  TodoServers._internal();
  factory TodoServers() => _instance;
  /// Opens the box if not opened yet, then returns it.
  Future<Box<TodoModel>> _getBox() async {
    if (_box != null && _box!.isOpen) {
      return _box!;
    }
    _box = await Hive.openBox<TodoModel>(HiveConstants.fileName);
    return _box!;
  }

  /// Get all TodoModel data from box
  Future<List<TodoModel>> getData() async {
    final box = await _getBox();
    return box.values.toList();
  }
  // Future<bool> isDeleteToBin({required int index})async{
    
  // }
  /// Delete data permanently by index
  Future<bool> deleteToPermanent({required int index}) async {
    final box = await _getBox();
    await box.deleteAt(index);
    return true;
  }

  Future<bool> deleteToBin({required int index}) async {
    final box = await _getBox();
    final item = box.getAt(index);
    if(item != null){
      final updatedItem = item.copyWith(isDelete: true);
      await box.put(index, updatedItem);
      return true;
      
    }
    return false;
  }
  Future<bool> recovered({required int index}) async {
    final box = await _getBox();
    final item = box.getAt(index);
    if(item != null){
      final updatedItem = item.copyWith(isDelete: false);
      await box.put(index, updatedItem);
      return true;
    }
    return false;
  }
  Future<bool> faverated({required int index}) async {
    final box = await _getBox();
    final item = box.getAt(index);
    if(item != null){
      final updatedItem = item.copyWith(isFaverate: (item.isFaverate)?false:true);
      await box.put(index, updatedItem);
      return true;
    }
    return false;
  }
  Future<bool> edited({required int index,String? title, String? content}) async {
    final box = await _getBox();
    final item = box.getAt(index);
    if(item != null){
      final updatedItem = item.copyWith(title: title,content: content);
      await box.put(index, updatedItem);
      return true;
    }
    return false;
  }
  Future<bool> completed({required int index}) async {
    final box = await _getBox();
    final item = box.getAt(index);
    if(item != null){
      final updatedItem = item.copyWith(isComplete: (item.isComplete)?false:true);
      await box.put(index, updatedItem);
      return true;
    }
    return false;
  }

  /// Add new data
  Future<bool> addData({
    required String title,
    required String content,
    bool isFavorite = false,
    bool isComplete = false,
    bool isDelete = false,
  }) async {
    final box = await _getBox();
    final data = TodoModel(
      title: title,
      content: content,
      isComplete: isComplete,
      isDelete: isDelete,
      isFaverate: isFavorite, // keep the original property name if that's your model's name
    );
    await box.add(data);
    return true;
  }

}
