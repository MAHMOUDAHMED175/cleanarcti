import 'package:cleanarcti/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarcti/core/utils/api_services.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() {
    ApiService.getData(url: 'volumes?Filtering=free-ebooks&q=programming');
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {}
}
