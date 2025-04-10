import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(bool?)? deleteFunction;
  
  // Add initial values for details
  final String? description;
  final String? priority;
  final DateTime? reminderDate;
  final DateTime? dueDate;
  
  // Add callback function to save details
  final Function(String?, String?, DateTime?, DateTime?)? onDetailsChanged;
  
  const ToDoList({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged, 
    required this.deleteFunction,
    this.description,
    this.priority,
    this.reminderDate,
    this.dueDate,
    this.onDetailsChanged,
  });

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  bool _isExpanded = false;
  late DateTime? _reminderDate;
  late DateTime? _dueDate;
  late String _priority;
  late String? _description;
  
  // Text controller for description
  late TextEditingController _descriptionController;
  
  // List of priority options
  final List<String> _priorities = ['Low', 'Normal', 'High', 'Urgent'];
  
  @override
  void initState() {
    super.initState();
    // Initialize with values from widget or defaults
    _description = widget.description;
    _priority = widget.priority ?? 'Normal';
    _reminderDate = widget.reminderDate;
    _dueDate = widget.dueDate;
    
    // Initialize controller with current description
    _descriptionController = TextEditingController(text: _description);
  }
  
  @override
  void dispose() {
    // Clean up controller
    _descriptionController.dispose();
    super.dispose();
  }
  
  // Save all details back to parent
  void _saveDetails() {
    if (widget.onDetailsChanged != null) {
      widget.onDetailsChanged!(
        _description,
        _priority,
        _reminderDate,
        _dueDate
      );
    }
  }
  
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
                // Description section with controller
                TextField(
                  controller: _descriptionController,
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
                    _saveDetails(); // Save when text changes
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
                        _saveDetails(); // Save when priority changes
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
                          _saveDetails(); // Save when reminder date changes
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
                          _saveDetails(); // Save when due date changes
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