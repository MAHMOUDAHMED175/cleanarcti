import 'package:cleanarcti/Features/home/data/models/book_model/book_model.dart';
import 'package:cleanarcti/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarcti/core/utils/api_services.dart';
import 'package:dio/src/response.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var response = await ApiService.getData(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> book = getBooksList(response);

    return book;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var response = await ApiService.getData(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> book = getBooksList(response);

    return book;
  }

  List<BookEntity> getBooksList(Response<dynamic> response) {
    List<BookEntity> book = [];
    for (var bookmap in response.data['items']) {
      book.add(BookModel.fromJson(bookmap));
    }
    return book;
  }
}
