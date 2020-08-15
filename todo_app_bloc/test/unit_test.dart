import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_bloc/BLoC/todo_bloc.dart';

void main() {
  group('ToDoBloc', () {
    blocTest(
      'emits [] when no events added',
      build: () => ToDosBloc([]),
      act: (todosBloc) => todosBloc.add(AddToDo(ToDoBloc('tester todo'))),
      expect: [
        [],
        ['tester todo']
      ],
    );
  });
}
