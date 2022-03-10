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
          title: const Text('ToDo アプリ'),
        ),
        body: Consumer<AddModel>(builder: (context, model, child) {
          return Column(
            children: [
              const TextField(),
              ElevatedButton(onPressed: () {}, child: child),
            ],
          );
        }),
      ),
    );
  }
}
