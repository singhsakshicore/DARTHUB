import 'package:hive_flutter/hive_flutter.dart';

class TodoDatBase {
  List TodoList = [];

  final _mybox = Hive.box('mybox');

  void createData() {
    TodoList = [
      ["TODO", false],
    ];
  }

  void loadData() {
    TodoList = _mybox.get("TODOLIST");
  }

  void updateDataBase() {
    _mybox.put("TODOLIST", TodoList);
  }
}
