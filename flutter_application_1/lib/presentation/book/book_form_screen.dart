import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/book.dart';
import 'package:flutter_application_1/presentation/book/book_view_model.dart';

class BookFormScreen extends StatefulWidget {
 BookViewModel bookViewModel = BookViewModel();

  @override
  _BookFormScreenState createState() => _BookFormScreenState();
}

class _BookFormScreenState extends State<BookFormScreen> {
TextEditingController titleController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Book'),),
      body: Container(

        child: TextButton(onPressed: (){
          setState(() {
            widget.bookViewModel.addBook(Book(
              title: titleController.text,
              description: 'description',
              year: 2002,
              pages: 20,
              language: 'Indonesia',
              publisher: 'Gramedia',
              price: 30000,
              stock: 20
            ));
          },
          );
          Navigator.pop(context, 'done');
        }, child: Text('Submit')),
      ),
    );
  }
}