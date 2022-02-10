import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    // 以下、エラーが出たので導きのまま変更。
    // title = doc.data()!['title'];
    // createdAt = doc.data()!['createdAt'];
    title = doc['title'];
    createdAt = doc['createdAt'];
  }

// 以下のエラーが出たため、late を付与してみた。
// Non-nullable instance field 'createdAt' must be initialized.
// Try adding an initializer expression, or add a field initializer in this constructor, or mark it 'late'.
  late String title;
  late DateTime createdAt;
}
