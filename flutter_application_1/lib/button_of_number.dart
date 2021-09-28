import 'dart:ffi';

import 'package:flutter/material.dart';

class ButtonOfNumber extends StatelessWidget {
  //const ButtonOfNumber({ Key? key }) : super(key: key);

  // symbol ? => optional
  final String number;
  final double? elevationSize;
  const ButtonOfNumber({required this.number, this.elevationSize});
  // {} => bisa melakukan set sebuah attribute optional atau required
  // {} => harus define nama atributenya ketika memanggil kelas ini
  // {} => dapat memanggil attribute tidak berurutan

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {},
        child: Text(number,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        color: Colors.amber[100],
        height: 75.0,
        elevation: elevationSize ?? 10,
        // elevation: elevationSize != null ? elevationSize : 10
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}