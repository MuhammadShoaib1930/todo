import 'package:hive/hive.dart';
import '../models/todo_model.dart'; // Adjust the path if needed

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
    await _todoBox.deleteAt(key);
  }

}
