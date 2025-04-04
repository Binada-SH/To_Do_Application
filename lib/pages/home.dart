import 'package:flutter/material.dart';
import 'package:to_do_application/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ["Get Up", false],
    ["Take A Meeting", false],
    ["Have Breakfast", false],

    ];

    void checkBoxChanged (int index) {
      setState(() {
        todoList [index] [1] =  !todoList [index][1];
        });    
    }

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
          onChanged: (value) => checkBoxChanged (index),
        );
      }),
      backgroundColor: Color(0xFFCDE8E5),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        ),
      
    );
    
  }
}
