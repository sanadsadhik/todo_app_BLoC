import 'package:todo_app_bloc/BLoC/todo_bloc.dart';

abstract class ToDoEvent {}

class AddToDo extends ToDoEvent {
  final ToDoBloc todo;
  AddToDo(this.todo, {position = 0});
}
