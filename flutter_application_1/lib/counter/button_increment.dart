import 'package:flutter/material.dart';

class IncrementButton extends StatelessWidget {
  final Function increment;
  const IncrementButton({ Key? key, required this.increment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      TextButton(
                  onPressed: () => increment(),
                  child: Text('+', style: TextStyle(fontSize: 50))),
    );
  }
}