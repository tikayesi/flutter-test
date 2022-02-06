import 'package:flutter_application_1/data/model/book.dart';
import 'package:flutter_application_1/data/repository/book_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'api_helper_mock.dart';

void main(){
  group('Book Repository Test', (){

    test('When Book Repository Add Book then Return Book', ()async{
      final dummyBook = Book(
        id: 1,
        title: 'title',
        description: 'description',
        year: 2001,
        pages: 100,
        language: 'Indonesia',
        publisher: 'Mana Saja',
        price: 200000,
        stock: 5
      );

      final _apiHelper = ApiHelperMock();
      when(_apiHelper.postData('/book', dummyBook.toMap()))
      .thenAnswer((_) async => Future<dynamic>.value(dummyBook.toMap()));

      final bookRepository = BookRepository(_apiHelper);
      final bookResult = bookRepository.addProduct(dummyBook);

      expect(bookResult, isA<Future<Book>>());
      expect((await bookResult).id, dummyBook.id);

    });

    test('When Book Repository Get Book Then return List of Book', () async {
      final dummyBooks = [Book(
          id: 1,
          title: 'title',
          description: 'description',
          year: 2001,
          pages: 100,
          language: 'Indonesia',
          publisher: 'Mana Saja',
          price: 200000,
          stock: 5
      ).toMap(),
        Book(
            id: 2,
            title: 'title',
            description: 'description',
            year: 2001,
            pages: 100,
            language: 'Indonesia',
            publisher: 'Mana Saja',
            price: 200000,
            stock: 5
        ).toMap()];

      final _apiHelper = ApiHelperMock();
      when(_apiHelper.getData('/book'))
      .thenAnswer((_) async => Future<dynamic>.value(dummyBooks));

      final bookRepository = BookRepository(_apiHelper);
      final bookResult = bookRepository.getProduct();

      expect(bookResult, isA<Future<List<dynamic>>>());
      expect((await bookResult).length, dummyBooks.length);

    });

  });
}