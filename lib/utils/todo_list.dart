import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatefulWidget {
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
  State<ToDoList> createState () => _ToDoListState();
}
class _ToDoListState extends State<ToDoList> {
  bool _isExapnded? = false;
  DateTime? = _reminderDate;
  DateTime? = _dueDate;
  String _priority = "Normal";
  String? _description;

  final List<String> _priorities = ['Low', 'Normal', 'High', 'Urgent'];
}