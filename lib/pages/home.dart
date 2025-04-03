import 'package:flutter/material.dart';
import 'package:to_do_application/utils/todo_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List todoList = [
    ["Get Up", false],
    ["Take A Meeting", false],
    ["Have Breakfast", false],

    ];

  @override 
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome",),
        backgroundColor: Color(0xFFCDE8E5),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (
          BuildContext context, index ) {
        return ToDoList(
          taskName: todoList[index] [0],
          taskCompleted: todoList[index][1],
        );
      }),
      backgroundColor: Color(0xFFCDE8E5),
    );
  }
}
