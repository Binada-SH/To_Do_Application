import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
  super.key, 
  required this.taskName, 
  required this.taskCompleted, 
  required this.onChanged, 
  required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?) ? onChanged;
  final Function(BuildContext) ? deleteFunction;


  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(
            top:20,
            bottom: 0,
            right: 20,
            left: 20,
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(), 
              children: [SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(18),
                backgroundColor: const Color.fromARGB(255, 251, 161, 154),
              )]),
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
                    onChanged: onChanged,
                    checkColor: Color(0xFFA8E1E1),
                    activeColor: Color(0xFF2B9898),
                    ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 16,
                      decoration: taskCompleted ? TextDecoration.lineThrough: TextDecoration.none,
            
                    ),
                  ),
                ],
              ), 
            ),
          ),
        );
  }
}