import 'dart:async';
import 'package:todo_app_bloc/BLoC/todo_event.dart';
import 'package:uuid/uuid.dart';

class ToDoBloc {
  var _uuid = Uuid();
  String _title;
  String _id;

  ToDoBloc(this._title) {
    this._id = _uuid.v4().toString();
  }
  String get id => _id;
  String get title => _title;

  @override
  String toString() => "$title $id";
}

class ToDosBloc extends ToDoEvent {
  List<ToDoBloc> _todosList = [];
  bool _displayToDo = false;

  //List<ToDoBloc> get todos => _todosList;

  int get todosCount => _todosList.length;
  get displayToDo => _displayToDo;

  final _toDosStateController = StreamController<List<ToDoBloc>>();
  StreamSink<List<ToDoBloc>> get _intodos => _toDosStateController.sink;
  Stream<List<ToDoBloc>> get todos => _toDosStateController.stream;

  final _toDoEventController = StreamController<ToDoEvent>();
  Sink<ToDoEvent> get todoEventSink => _toDoEventController.sink;

  ToDosBloc() {
    _toDoEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ToDoEvent event) {
    if (event is AddToDo) {
      _todosList.insert(event.position, event.todo);
    }
    _intodos.add(_todosList);
    return;
  }

  void _dispose() {
    _toDosStateController.close();
    _toDoEventController.close();
  }
}
