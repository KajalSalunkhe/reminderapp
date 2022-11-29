import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminderapp/models/task_model.dart';
import 'package:uuid/uuid.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(TaskModel) onTaskCreated;
  const AddTaskScreen({super.key, required this.onTaskCreated});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  // DateTime?scheduleDate;
  DateTime scheduleDate = DateTime.now();

  void createMyTask() {
    String title = titleController.text.trim();
    if (title == "") {
      log("please enter title");
      return;
    }
    if (scheduleDate == null) {
      log("please seelct date");
      return;
    }
    String name = TaskModel.myName; // without cls initialize

    TaskModel myTask = TaskModel(
      id: const Uuid().v1(),
      title: title,
      scheduleDate: scheduleDate,
    );
    widget.onTaskCreated(myTask);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createMyTask();
        },
        child: const Icon(Icons.check),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          TextField(
            controller: titleController,
            autofocus: true,
            decoration: const InputDecoration(
              // hintText: "Task Title",
              labelText: "Task Title",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 150,
            child: CupertinoDatePicker(
              onDateTimeChanged: (date) {
                log(date.toString());
                scheduleDate = date;
              },
            ),
          )
        ],
      )),
    );
  }
}
