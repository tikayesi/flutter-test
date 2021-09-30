import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/to_do_detail.dart';
import 'package:flutter_application_1/presentation/to_do_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // class yang tidak memegang state
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        routes: {
          '/' : (context) => ToDoScreen()
        },
        );
  }
}

