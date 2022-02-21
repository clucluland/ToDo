import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_sample/main_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToTo アプリ Demo',
      // 16:23 あたり
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel()..getTodoList(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ToDo アプリ'),
          ),
          body: const Text(
            'You have pushed the button this many times:',
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
