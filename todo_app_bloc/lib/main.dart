import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/BLoC/todo_bloc.dart';
import 'BLoC/todo_bloc.dart';
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
        home: BlocProvider(
          create: (_) => ToDosBloc([]),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoTextController = TextEditingController();
    final todosbloc = BlocProvider.of<ToDosBloc>(context);
    return Scaffold(
      body: Column(children: <Widget>[
        Row(
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
                  todosbloc.add(AddToDo(ToDoBloc(todoTextController.text)));
                }
                todoTextController.clear();
              },
              child: Text(
                "ADD TODO",
              ),
            )
          ],
        ),
        Expanded(
            child: SizedBox(
                height: 200.0,
                child: BlocBuilder<ToDosBloc, List<ToDoBloc>>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(state[index].title,
                                style: TextStyle(fontSize: 18)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SingleToDoScreen(todo: state[index]),
                                ),
                              );
                            });
                      },
                    );
                  },
                ))),
      ]),
    );
  }
}
