import 'package:flutter/material.dart';
import 'package:flutter_application_1/counter/counter.dart';
import 'package:flutter_application_1/my_home_page.dart';

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
        home: MyHomePage());
  }
}

