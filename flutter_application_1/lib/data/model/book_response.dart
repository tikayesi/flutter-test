import 'package:flutter_application_1/data/model/book.dart';

class BookResponse{
  List<dynamic> books;

  BookResponse({required this.books});

  factory BookResponse.fromList(List<dynamic> listOfBook){
    List<dynamic> listBook = listOfBook.map((e) => Book.fromMap(e)).toList();

    return BookResponse(books: listBook);
  }

}