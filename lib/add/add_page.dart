import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_model.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddModel>(
      create: (_) => AddModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo 追加'),
        ),
        body: Consumer<AddModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: '追加ToDo',
                    hintText: '具体的に記載',
                  ),
                  onChanged: (text) {
                    model.todoText = text;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    // ignore: Firestoreに値を追加
                    model.add();
                    Navigator.pop(context);
                  },
                  child: const Text('追加'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
