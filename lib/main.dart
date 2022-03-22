import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_sample/add/add_page.dart';
import 'package:todo_sample/main_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToTo アプリ Demo',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel()..getTodoListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo アプリ'),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                '完了',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Consumer<MainModel>(builder: (context, model, child) {
          final todoList = model.todoList;
          return ListView(
            children: todoList
                .map(
                  (todo) => CheckboxListTile(
                    title: Text(todo.title),
                    value: todo.isDone,
                    onChanged: (bool? value) {
                      todo.isDone = !todo.isDone;
                      // ↓ リロードするだけのものを呼ぶと警告受ける
                      // model.notifyListeners();
                      // そのため、リロードのプロシージャを用意
                      model.reload();
                    },
                  ),
                )
                .toList(),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPage(),
                fullscreenDialog: true,
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
