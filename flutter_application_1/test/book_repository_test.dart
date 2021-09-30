import 'package:flutter_application_1/data/model/book.dart';
import 'package:flutter_application_1/data/model/book_response.dart';
import 'package:flutter_application_1/data/repository/book_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'api_helper_mock.dart';

void main() {
  group('Book repository test', () {
    test('When Book Repository Add Book Return Book', () async {
      final dummyBook = Book(
          id: 123,
          title: 'title',
          description: 'desc',
          year: 1500,
          pages: 0,
          language: 'language',
          publisher: 'publisher',
          price: 1,
          stock: 1);

      final _apiHelper = ApiHelperMock();
      when(_apiHelper.postData('/book', dummyBook.toMap()))
          .thenAnswer((_) async => Future<dynamic>.value(dummyBook.toMap()));

      final bookRepository = BookRepository(_apiHelper);

      final bookResult = bookRepository.addProduct(dummyBook);
      expect(bookResult, isA<Future<Book>>());
      expect((await bookResult).id, dummyBook.id);
    });

    test("When Book Repository get All book return list of book", () async {
      final dummyBooks = [Book(
          id: 123,
          title: 'title',
          description: 'desc',
          year: 1500,
          pages: 0,
          language: 'language',
          publisher: 'publisher',
          price: 1,
          stock: 1
      ).toMap(),
        Book(
            id: 123,
            title: 'title',
            description: 'desc',
            year: 1500,
            pages: 0,
            language: 'language',
            publisher: 'publisher',
            price: 1,
            stock: 1
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