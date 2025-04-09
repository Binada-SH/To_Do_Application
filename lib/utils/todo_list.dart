import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(bool?)? deleteFunction;
  
  const ToDoList({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged, 
    required this.deleteFunction
  });

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  bool _isExpanded = false;
  DateTime? _reminderDate;
  DateTime? _dueDate;
  String _priority = 'Normal'; // Default priority
  String? _description;
  
  // List of priority options
  final List<String> _priorities = ['Low', 'Normal', 'High', 'Urgent'];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main task container
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFAAE9E9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: widget.taskCompleted,
                onChanged: widget.onChanged,
                activeColor: Colors.black54,
              ),
              
              // Task name
              Expanded(
                child: Text(
                  widget.taskName,
                  style: TextStyle(
                    fontFamily: 'Jura',
                    fontSize: 16,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700,
                    decoration: widget.taskCompleted 
                      ? TextDecoration.lineThrough 
                      : TextDecoration.none,
                    decorationThickness: 2.0,
                  ),
                ),
              ),
              
              // Expand button
              IconButton(
                icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
              
              // Delete button
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => widget.deleteFunction!(true),
              ),
            ],
          ),
        ),
        
        // Expandable container for additional info
        if (_isExpanded)
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 8, left: 24, right: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFD0F0F0),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFAAE9E9), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description section
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Add description...',
                    hintStyle: TextStyle(
                      fontFamily: 'Jura',
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                  maxLines: 2,
                  minLines: 1,
                ),
                
                const SizedBox(height: 10),
                
                // Priority dropdown
                Row(
                  children: [
                    const Text(
                      'Priority: ',
                      style: TextStyle(
                        fontFamily: 'Jura',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    DropdownButton<String>(
                      value: _priority,
                      items: _priorities.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontFamily: 'Jura',
                              color: value == 'Urgent' 
                                ? Colors.red 
                                : value == 'High' 
                                  ? Colors.orange 
                                  : value == 'Low' 
                                    ? Colors.green 
                                    : Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _priority = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                
                const SizedBox(height: 10),
                
                // Date pickers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Reminder date picker
                    TextButton.icon(
                      icon: const Icon(Icons.notifications_outlined, size: 20),
                      label: Text(
                        _reminderDate == null 
                          ? 'Set Reminder' 
                          : DateFormat('MMM d, y').format(_reminderDate!),
                        style: const TextStyle(
                          fontFamily: 'Jura',
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null && picked != _reminderDate) {
                          setState(() {
                            _reminderDate = picked;
                          });
                        }
                      },
                    ),
                    
                    // Due date picker
                    TextButton.icon(
                      icon: const Icon(Icons.calendar_today, size: 20),
                      label: Text(
                        _dueDate == null 
                          ? 'Due Date' 
                          : DateFormat('MMM d, y').format(_dueDate!),
                        style: const TextStyle(
                          fontFamily: 'Jura',
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null && picked != _dueDate) {
                          setState(() {
                            _dueDate = picked;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}