part of 'todo_state_menagment_bloc.dart';

class TodoState extends Equatable {
  final List<TodoModel> data;
  final int currentIndex;
  const TodoState({this.data = const [],this.currentIndex = 0});
  @override
  List<Object> get props => [data, currentIndex];
}
