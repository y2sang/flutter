import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('One-line with leading widget'),
        trailing: Checkbox(value: false, onChanged: null),
      ),
    );
  }
}
