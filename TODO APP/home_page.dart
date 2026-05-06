import 'package:first_app/database/databse.dart';
import 'package:first_app/utils/dialog_box.dart';
import 'package:first_app/utils/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  final _myBox = Hive.box("mybox");
  TodoDatBase db = TodoDatBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // List TodoList = [
  //  ["TODO", false],
  //["TODO", false],
  //["TODO", false],
  //["TODO", false],
  //["TODO", false],
  //["TODO", false],
  // ];

  void deleteTask(int index) {
    setState(() {
      db.TodoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.TodoList[index][1] = !db.TodoList[index][1];
    });
  }

  void onChanged(bool? value) {
    setState(() {});
  }

  void saveNewTask() {
    setState(() {
      db.TodoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text("TODO"),
        backgroundColor: Colors.deepPurple,
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.deepPurple[400],
        child: Icon(Icons.add, color: Colors.white),
      ),

      body: ListView.builder(
        itemCount: db.TodoList.length,
        itemBuilder: (context, index) {
          return TodoItem(
            isChecked: db.TodoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            todoText: db.TodoList[index][0],
          );
        },
      ),
    );
  }
}
