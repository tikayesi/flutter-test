import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/to_do.dart';

class ToDoDetail extends StatelessWidget {
  final ToDo toDo;
  const ToDoDetail({ Key? key, required this.toDo }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('To Do Detail'),),
      body: Container(
        child: Column(
          children: [
            TextButton(child: Text('Back'), onPressed: (){
              Navigator.pop(context);
            }),
            Text(toDo.toDoName),
            Text(toDo.toDoDesc),
            Text(toDo.toDoTime)
          ],
        ),
      ),
    ));
  }
}