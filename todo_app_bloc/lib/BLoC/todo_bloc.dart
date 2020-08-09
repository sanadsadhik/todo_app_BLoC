import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/BLoC/todo_event.dart';
import 'package:uuid/uuid.dart';

abstract class ToDoEvent {}

class AddToDo extends ToDoEvent {
  final ToDoBloc todo;
  AddToDo(this.todo, {position = 0});
}

class ToDoBloc {
  var _uuid = Uuid();
  String _title;
  String _id;

  ToDoBloc(this._title) {
    //this._id = _uuid.v4().toString();
  }
  String get id => _id;
  String get title => _title;

  @override
  String toString() => "$title";
}

class ToDosBloc extends Bloc<AddToDo, List<ToDoBloc>> {
  /*
  @override
  List<ToDoBloc> get initialState => [];
  */
  ToDosBloc(List<ToDoBloc> initialState) : super(initialState);

  //List<ToDoBloc> get todosList => [];
  bool _displayToDo = false;

  //List<ToDoBloc> get todos => _todosList;

  //int get todosCount => todosList.length;
  get displayToDo => _displayToDo;

  @override
  Stream<List<ToDoBloc>> mapEventToState(AddToDo event) async* {
    state.insert(0, event.todo);
  }
}
