import 'package:cleanarcti/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarcti/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
