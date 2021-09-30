import 'package:flutter/material.dart';

class ToDoDetail extends StatelessWidget {
  const ToDoDetail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('To Do Detail'),),
      body: Container(
        child: TextButton(child: Text('Back'), onPressed: (){
          Navigator.pop(context);
        }),
      ),
    ));
  }
}