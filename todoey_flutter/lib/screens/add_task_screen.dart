import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String) callbackFunc;

  AddTaskScreen({required this.callbackFunc});

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                controller: myController,
              ),
              TextButton(
                  onPressed: () {
                    callbackFunc(myController.text);
                  },
                  child: Text('Add'),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.lightBlueAccent))
            ],
          ),
        ));
  }
}
