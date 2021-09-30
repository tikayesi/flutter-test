import 'package:flutter_application_1/model/to_do.dart';

class ToDoRepository {
  List<ToDo> todos = <ToDo>[];


  List<ToDo> getListToDo(){
    return todos;
  }

  addToDo(ToDo newToDo) {
    todos.add(newToDo);
      print(todos[0].toDoName);
  }
}
