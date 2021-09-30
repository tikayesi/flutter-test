import 'package:flutter/material.dart';
import 'package:flutter_application_1/to_do_detail.dart';
import 'package:flutter_application_1/widget/text_field_widget.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ToDo {
  int id;
  String toDoName;
  String toDoDesc;
  String toDoTime;

  ToDo(this.id, this.toDoName, this.toDoDesc, this.toDoTime);
}

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<ToDo> todos = <ToDo>[];
  TextEditingController toDoName = new TextEditingController();
  TextEditingController toDoDesc = new TextEditingController();
  TextEditingController toDoTime = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  addToDo() {
    setState(() {
      todos.add(new ToDo(
          todos.length + 1, toDoName.text, toDoDesc.text, toDoTime.text));
    });
  }

  // Widget textFormField(TextEditingController con, String hint) {
  //   return TextFormField(
  //       controller: con,
  //       decoration: InputDecoration(hintText: hint),
  //       validator: (String? value) {
  //         if (value == null || value.isEmpty) {
  //           return 'Please enter your to do!';
  //         } else {
  //           return null;
  //         }
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        con: toDoName,
                        hint: 'Enter Your To Do!',
                        validate: MultiValidator([
                          RequiredValidator(errorText: 'To Do is Required'),
                          MinLengthValidator(5, errorText: '5 min char')
                        ]),
                        ),
                      // textFormField(toDoName, 'Enter Your To Do!'),
                      // textFormField(toDoDesc, 'Please enter your Description!'),
                      // textFormField(toDoTime, 'Please enter your Time!'),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                addToDo();
                              }
                            },
                            child: const Text('Submit')),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: Card(
                child: Scrollbar(
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                leading: Icon(Icons.access_alarm),
                                title: Text(todos[index].toDoName,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                onTap: (){
                                  //Navigator.pushNamed(context, '/detail');
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoDetail()));
                                },
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 5.0,
                          color: Colors.red,
                        )
                      ],
                    );
                  },
                  // separatorBuilder: (context, index){
                  //   return Divider(height: 5.0, color: Colors.blue,);
                  // },
                  itemCount: todos.length,
                )),
              ),
            )
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     children: todos.map((e) => Padding(
            //       padding: const EdgeInsets.all(20.0),
            //       child: new Text(e),
            //     )).toList(),
            //   ),
            // )
          ],
        ),
      ),
    ));
  }
}
