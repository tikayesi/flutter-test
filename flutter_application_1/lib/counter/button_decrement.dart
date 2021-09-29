import 'package:flutter/material.dart';

class DecrementButton extends StatelessWidget {
  final VoidCallback decrement;
  const DecrementButton({ Key? key , required this.decrement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
                  onPressed: decrement,
                  child: Text('-', style: TextStyle(fontSize: 50))),
    );
  }
}