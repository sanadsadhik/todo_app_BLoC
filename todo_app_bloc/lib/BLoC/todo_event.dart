import 'package:todo_app_bloc/BLoC/todo_bloc.dart';

abstract class ToDoEvent {}

class AddToDo extends ToDoEvent {
  final ToDoBloc todo;
  int position = 0;
  AddToDo(this.todo, {this.position});
}
