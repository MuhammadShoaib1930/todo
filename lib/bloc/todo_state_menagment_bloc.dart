import 'package:todo/import_packages/bloc_packages.dart';
import 'package:intl/intl.dart';
part 'todo_state_menagment_event.dart';
part 'todo_state_menagment_state.dart';

class TodoStateMenagmentBloc extends Bloc<TodoBaseEvent, TodoState> {
  TodoStateMenagmentBloc()
    : super(TodoState(currentIndex: 0, data: TodoServers().getAllTodos())) {
    on<ChangeScreenEvent>(_changeScreenEvent);
    on<AddDataEvent>(_addDataEvent);
    on<CompletedEvent>(_completedEvent);
    on<FavoriteEvent>(_favoriteEvent);
    on<EditeEvent>(_editeEvent);
    on<DeletedEvent>(_deletedEvent);
    on<DeletedPermenantEvent>(_deletedPermenantEvent);
  }

  FutureOr<void> _changeScreenEvent(
    ChangeScreenEvent event,
    Emitter<TodoState> emit,
  ) {
    emit(TodoState(data: state.data, currentIndex: event.currentIndex));
  }

  FutureOr<void> _addDataEvent(AddDataEvent event, Emitter<TodoState> emit) async{

    DateTime dateTime = DateTime.now();
    String date = DateFormat('dd : MM : yyyy').format(dateTime);
    String time = DateFormat('HH : mm : ss').format(dateTime);
    TodoModel item = TodoModel(
      title: event.title,
      content: event.content,
      date: date,
      time: time,
      favorite: false,
      deleted: false,
      completed: false,
      edited: 0,
    );
    await TodoServers().addTodo(item).then((value) =>emit(
      TodoState(
        currentIndex: state.currentIndex,
        data: TodoServers().getAllTodos(),
      ),
    ));
  }

  FutureOr<void> _completedEvent(
    CompletedEvent event,
    Emitter<TodoState> emit,
  ) async{
    TodoModel item = event.item;
    final int key = event.todoModelKey;
    item.completed = !item.completed;
    await TodoServers().updateTodo(key, item).then((value) => emit(
      TodoState(
        currentIndex: state.currentIndex,
        data: TodoServers().getAllTodos(),
      ),
    ));
  }

  FutureOr<void> _favoriteEvent(FavoriteEvent event, Emitter<TodoState> emit)async {
    TodoModel item = event.item;
    final int key = event.todoModelKey;
    item.favorite = !item.favorite;
    await TodoServers().updateTodo(key, item).then((value) => 
    emit(
      TodoState(
        currentIndex: state.currentIndex,
        data: TodoServers().getAllTodos(),
      ),
    ));
  }

  FutureOr<void> _editeEvent(EditeEvent event, Emitter<TodoState> emit) async{
    TodoModel item = event.item;
    final int key = event.todoModelKey;
    final String title = event.title;
    final String content = event.content;
    DateTime dateTime = DateTime.now();
    String date = DateFormat('dd : MM : yyyy').format(dateTime);
    String time = DateFormat('HH : mm : ss').format(dateTime);
    await TodoServers().updateTodo(key, TodoModel(title: title, content: content, date: date, time: time, favorite: false, deleted: false, completed: false, edited: item.edited+1)).then((value) => 
    emit(TodoState(currentIndex: state.currentIndex, data: TodoServers().getAllTodos())));
  }

  FutureOr<void> _deletedEvent(DeletedEvent event, Emitter<TodoState> emit) async{
    TodoModel item = event.item;
    final int key = event.todoModelKey;
    item.deleted = !item.deleted;
    await TodoServers().updateTodo(key, item).then((value) => 
    emit(
      TodoState(
        currentIndex: state.currentIndex,
        data: TodoServers().getAllTodos(),
      ),
    ));
  }


  FutureOr<void> _deletedPermenantEvent(DeletedPermenantEvent event, Emitter<TodoState> emit) {
    TodoServers().deleteTodo(event.todoModelKey);
    emit(TodoState(currentIndex: state.currentIndex,data: TodoServers().getAllTodos()));
  }
}
