import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class ToDoList extends StatefulWidget {

  final String taskName;
  final bool taskCompleted;
  final Function(bool?) ? onChanged;
  final Function(BuildContext) ? deleteFunction;

  const ToDoList({
  super.key, 
  required this.taskName, 
  required this.taskCompleted, 
  required this.onChanged, 
  required this.deleteFunction,
  });
  
  @override
  State<ToDoList> createState () => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  bool _isExapnded? = false;
  DateTime? = _reminderDate;
  DateTime? = _dueDate;
  String _priority = "Normal";
  String? _description;

  final List<String> _priorities = ['Low', 'Normal', 'High', 'Urgent'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xFFAAE9E9),
            borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: widget.taskCompleted,
                  onChanged: widget.onChanged,
                  activeColor: Color(0xFFAAE9E9),
                ),

                Expanded(
                  child: Text(
                    widget.taskName,
                    style: TextStyle(
                      fontFamily: 'Jura',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.3,
                      decoration: widget.taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                      decorationThickness: 2.0,
                    ),
                  ), 
                ),
                IconButton(
                  icon: Icon(_isExapnded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState (() {
                      _isExapnded = !_isExapnded;
                    });
                  },
                ),
                
              ],
            ),
        )
      ],
    )
  }
}