import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminderapp/models/task_model.dart';
import 'package:reminderapp/screens/add_task_screen.dart';

//widget layer

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//state layer
class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [];
  String formatDate(DateTime date) {
    DateFormat myFormat = DateFormat("EEE, dd, MMM, yyyy > hh:mm a");
    return myFormat.format(date);
  }
  // TaskModel(
  //   id: "xyz",
  //   title: "Something",
  //   scheduleDate: DateTime.now(),
  // ),
  // TaskModel(
  //   id: "xyz",
  //   title: "Something2",
  //   scheduleDate: DateTime.now(),
  // )
  // define var
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "RemidersApp",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return AddTaskScreen(
                      onTaskCreated: (myTask) {
                        setState(() {
                          tasks.add(myTask);
                        });
                        log("Task Received!!");
                      },
                    );
                  }));
        }, // anonymous fun
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: (tasks.isNotEmpty)
            ? ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      tasks[index].title.toString(),
                    ),
                    subtitle: Text(
                      formatDate(tasks[index].scheduleDate!),
                      // tasks[index].scheduleDate.toString(),
                    ),
                  );
                },
              )
            : const Center(
                child: Icon(
                  Icons.note_alt,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
      ),
    );
  }
}


//models-> services/repo->screens