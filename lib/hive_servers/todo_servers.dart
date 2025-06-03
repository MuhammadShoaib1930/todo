import 'package:todo/import_packages/ui_packages.dart';

class TodoServers {
  static final fileName = "myDataBase";
  // Singleton instance
  static final TodoServers _instance = TodoServers._internal();

  // Factory constructor returns the same instance
  factory TodoServers() => _instance;

  // Private named constructor
  TodoServers._internal();

  // Reference to the Hive box
  late Box<TodoModel> _todoBox;

  /// Initialize Hive box (must be called before using other methods)
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TodoModelAdapter()); // Register the adapter if not yet
    }
    _todoBox = await Hive.openBox<TodoModel>(fileName);
  }
  Box<TodoModel> box()=>_todoBox;

  /// Get all todos
  List<TodoModel> getAllTodos() {
    return _todoBox.values.toList();
  }

  /// Add a new todo
  Future<void> addTodo(TodoModel todo) async {
    await _todoBox.add(todo);
  }

  /// Update a todo by key
  Future<void> updateTodo(int key , TodoModel updatedTodo) async {
    await _todoBox.put(key,updatedTodo);
    
  }

  /// Delete a todo by key
  Future<void> deleteTodo(int key) async {
    await _todoBox.delete(key);
  }
  Future<void> deleteAllPadding()async{
     List<TodoModel> data = _todoBox.values.where((item) => !item.completed && !item.favorite && !item.deleted).toList();
    await _deletedList(data);
  }
  Future<void> deleteAllComplete()async{
 List<TodoModel> data = _todoBox.values.where((item) => item.completed).toList();
    await _deletedList(data);
  }
  Future<void> deleteAllFavorate()async{
     List<TodoModel> data = _todoBox.values.where((item) => item.favorite).toList();
    await _deletedList(data);

  }
  Future<void> _deletedList(List<TodoModel> data)async{
    for (TodoModel item in data) {
      await _todoBox.delete(item.key);
    }
  }


  Future<void> deleteAllDeleted()async{
    List<TodoModel> data = _todoBox.values.where((item) => item.deleted).toList();
    await _deletedList(data);
  }
  Future<void> deleteAllData()async{
    await _todoBox.clear();
  }
}
