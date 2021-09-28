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

Column keyPadFun(){
  List col = [
    ['1', '2', '3'],
    [ '4', '5', '6']
    ];
  return Column(
    children: 
    List.generate(col.length, (index) =>
    _numberRow(col[index])
    ));
}

Widget _numberRow(List<String> numbers){
  return Row(children: List.generate(numbers.length, (index) =>
  _buttonOfNumberBuilder(numbers[index])),);
}

Widget _buttonOfNumberBuilder(String num){
  return ButtonOfNumber(number: num,);
}

class _MyHomePageState extends State<MyHomePage> {


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
             keyPadFun()
            ],
          ),
        ],
      )),
    );
  }
}
