import 'package:flutter/material.dart';
import 'package:flutter_application_1/button_of_number.dart';

class MyHomePage extends StatefulWidget {
  // class yang memegang state
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// reformat code
// shift + alt + f -> win
// shift + option + f -> mac
// ctrl + shift + I -> linux
class _MyHomePageState extends State<MyHomePage> {

  MaterialButton _button(String number) {
    return MaterialButton(
      onPressed: () {},
      child: Text(number,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      color: Colors.amber[100],
      height: 75.0,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.blue),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BNI X ENIGMA'),
      ),
      body: Center(
          child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                child: Text('Row1'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Column'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Column'),
              ),
            ],
          ),
          Column(
            children: [
              // TextButton(
              //     onPressed: () {},
              //     child: Text('1'),
              //     style: TextButton.styleFrom(primary: Colors.green)),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text('button'),
              //   style: ElevatedButton.styleFrom(
              //       primary: Colors.orange,
              //       onPrimary: Colors.white),
              // ),
             _button('1'),
             _button('2'),
             _button('3'),
             ButtonOfNumber()
            ],
          ),
        ],
      )),
    );
  }
}
