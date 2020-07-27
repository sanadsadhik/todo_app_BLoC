import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_bloc/BLoC/todo_bloc.dart';

// ignore: must_be_immutable
class SingleToDoScreen extends StatelessWidget {
  ToDoBloc todo;
  SingleToDoScreen({Key key, @required this.todo}) : super(key: key);
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Todo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.title),
      ),
    );
  }
}
