import 'package:flutter/material.dart';
import 'package:to_do_application/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List todoList = [];
  bool _showExtraOptions = false;
  DateTime ? _reminderDateTime;
  DateTime ? _dueDate;
  String ? _description;



    void checkBoxChanged (int index) {
      setState(() {
        todoList [index] [1] =  !todoList [index][1];
        });    
    }

    void saveNewTask () {
      setState(() {
        todoList.add([_controller.text, false]);
        _controller.clear();
      });
    }

    void deleteTask (int index) {
      setState(() {
        todoList.removeAt(index);
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
          deleteFunction: (value) => deleteTask(index),
        );
      }),
      backgroundColor: Color(0xFFCDE8E5),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Row(
          children: [ 
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Add new Task",
                    filled: true,
                    fillColor: Color(0xFFAAE9E9),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFB0B2B2),
                        ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF000000),
                        
                      ),
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                ),
              )
              ),
            FloatingActionButton(
              backgroundColor: Color(0xFFAAE9E9),
              foregroundColor: Color(0xFF000000),
              elevation: 1,
              onPressed: saveNewTask,
              child: Icon(Icons.add),
              ),
          ],
        ),
      ),
      
    );
    
  }
}
