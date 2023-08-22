import 'package:cleanarcti/Features/home/data/models/book_model/book_model.dart';
import 'package:cleanarcti/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarcti/constants.dart';
import 'package:cleanarcti/core/utils/api_services.dart';
import 'package:cleanarcti/core/utils/functions/save_books.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({required int pageNumber});

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var response = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}');
    List<BookEntity> book = getBooksList(response);
    saveBooks(book, kFeaturedBox);
    return book;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var response = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> book = getBooksList(response);
    saveBooks(book, kNewestBox);

    return book;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> response) {
    List<BookEntity> book = [];
    for (var bookmap in response['items']) {
      book.add(BookModel.fromJson(bookmap));
    }
    return book;
  }
}
