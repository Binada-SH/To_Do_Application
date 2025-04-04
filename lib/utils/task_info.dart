import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showTaskDetailSheet(
  BuildContext context, 
  String taskTitle) {
  DateTime ? selectDateTime;

  showModalBottomSheet(
    context: context, 
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18)),
    ),
  builder: (context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 20,
        left: 20,
        right: 20,
      ),
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
          );
        }
        ),
      );
  };
}