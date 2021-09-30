import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/api/api_helper.dart';
import 'package:flutter_application_1/data/api/api_helper_impl.dart';
import 'package:flutter_application_1/data/model/book.dart';
import 'package:flutter_application_1/data/repository/book_repository.dart';
import 'package:flutter_application_1/presentation/book/book_view_model.dart';

class BookFormScreen extends StatefulWidget {
  late BookViewModel _bookViewModel;

  BookFormScreen() {
   ApiHelper apiHelper = ApiHelperImpl.INSTANCE;
   BookRepository _bookRepository = BookRepository(apiHelper);
   _bookViewModel = BookViewModel(_bookRepository);
 }

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
            widget._bookViewModel.addBook(Book(
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