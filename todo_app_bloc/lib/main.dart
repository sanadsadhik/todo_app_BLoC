import 'package:flutter/material.dart';
import 'package:todo_app_bloc/BLoC/todo_bloc.dart';
import 'BLoC/todo_event.dart';
import 'SingleToDoScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoApp-BLoC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ToDo app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = ToDosBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMainContent(),
    );
  }

  _buildMainContent() {
    return Column(children: <Widget>[
      _buildToDoEntry(),
      _buildToDoList(),
    ]);
  }

  _buildToDoEntry() {
    final todoTextController = TextEditingController();

    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            controller: todoTextController,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a ToDo'),
          ),
        ),
        FlatButton(
          onPressed: () {
            if (todoTextController.text.isNotEmpty) {
              _bloc.todoEventSink
                  .add(AddToDo(ToDoBloc(todoTextController.text)));
            }
            todoTextController.clear();
          },
          child: Text(
            "ADD TODO",
          ),
        )
      ],
    );
  }

  _buildToDoList() {
    return Expanded(
        child: SizedBox(
      height: 200.0,
      child: StreamBuilder(
        stream: _bloc.todos,
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          return ListView.builder(
            itemCount: _bloc.todosCount,
            itemBuilder: (context, index) {
              return buildTodotext(snapshot.data[index]);
            },
          );
        },
      ),
    ));
  }

  buildTodotext(ToDoBloc todo) {
    return Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: ListTile(
            title: Text(todo.title, style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SingleToDoScreen(todo: todo),
                ),
              );
            }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
}
