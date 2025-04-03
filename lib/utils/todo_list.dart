import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
  super.key, 
  required this.taskName, 
  required this.taskCompleted, this.onChanged,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?) ? onChanged;


  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(
            top:20,
            bottom: 0,
            right: 20,
            left: 20,
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFA8E1E1),
              borderRadius: BorderRadius.circular(18)
            ),
            
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged),
                Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Jura",
                  ),
                ),
              ],
            ), 
          ),
        );
  }
}