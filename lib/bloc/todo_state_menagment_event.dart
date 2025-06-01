part of 'todo_state_menagment_bloc.dart';

abstract class TodoBaseEvent extends Equatable {}

class ChangeScreenEvent extends TodoBaseEvent{
  final int currentIndex;
  ChangeScreenEvent({required this.currentIndex});
  @override
  List<Object?> get props => [currentIndex]; 
  
}
class AddDataEvent extends TodoBaseEvent{
  final String title;
  final String content;
  AddDataEvent({required this.title, required this.content});
  @override
  List<Object?> get props => [title, content]; 
}
class CompletedEvent extends TodoBaseEvent{
  final int todoModelKey;
  final TodoModel item;
  CompletedEvent({required this.item,required this.todoModelKey});
  @override
  List<Object?> get props => [item,todoModelKey]; 
}
class FavoriteEvent extends TodoBaseEvent{
  final int todoModelKey;
  final TodoModel item;
  FavoriteEvent({required this.item,required this.todoModelKey});
  @override
  List<Object?> get props => [item,todoModelKey]; 
}
class EditeEvent extends TodoBaseEvent{
  final int todoModelKey;
  final TodoModel item;
  final String title;
  final String content;
  EditeEvent({required this.item,required this.title, required this.content,required this.todoModelKey});
  @override
  List<Object?> get props => [item,title,content,todoModelKey]; 
}
class DeletedEvent extends TodoBaseEvent{
  final int todoModelKey;
  final TodoModel item;
  DeletedEvent({required this.item,required this.todoModelKey});
  @override
  List<Object?> get props => [item,todoModelKey]; 
}
