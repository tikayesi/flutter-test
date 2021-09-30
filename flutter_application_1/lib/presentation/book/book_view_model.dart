import 'package:flutter_application_1/data/model/book.dart';
import 'package:flutter_application_1/data/repository/book_repository.dart';

class BookViewModel {
    BookRepository _bookRepository = BookRepository();

    addBook(Book newBook)async{
      final newBookRegistered = await _bookRepository.addProduct(newBook);
      print(newBookRegistered);
    }

    Future<List<dynamic>> getBook()async{
        final getListBook = await _bookRepository.getProduct();
        return getListBook;
    }
}