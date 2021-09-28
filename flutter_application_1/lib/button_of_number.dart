import 'package:flutter/material.dart';

class ButtonOfNumber extends StatelessWidget {
  const ButtonOfNumber({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {},
        child: Text('1',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        color: Colors.amber[100],
        height: 75.0,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}