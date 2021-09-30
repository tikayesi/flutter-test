import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/api/api_helper.dart';
import 'package:flutter_application_1/data/api/api_helper_impl.dart';
import 'package:flutter_application_1/data/model/book.dart';
import 'package:flutter_application_1/data/repository/book_repository.dart';
import 'package:flutter_application_1/presentation/book/book_view_model.dart';

class BookListScreen extends StatefulWidget {
  late BookViewModel _bookViewModel;

  BookListScreen() {
    ApiHelper apiHelper = ApiHelperImpl.INSTANCE;
    BookRepository _bookRepository = BookRepository(apiHelper);
    _bookViewModel = BookViewModel(_bookRepository);
  }

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<dynamic> listBook = <Book>[];

  @override
  void initState(){
    super.initState();
    _getListBook();
  }


  _getListBook() async{
    listBook =  await widget._bookViewModel.getBook();
    Future.delayed(const Duration(microseconds: 500), (){
      setState(() {
        listBook = listBook;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('Book List'),
            TextButton(
              onPressed: () async{
               final status = await Navigator.pushNamed(context, '/add-book');
              if(status == 'done'){
                setState(() {
                     _getListBook();
                });
              }
              },
              child: Text('Add Book'),
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
                            leading: Icon(Icons.book, size: 40.0),
                            title: Text(listBook[index].title),
                          )),
                        ],
                      ),
                      Divider(height: 5.0)
                    ],
                  );
                },
                itemCount: listBook.length,
              )),
            ))
          ],
        ),
      ),
    );
  }
}
