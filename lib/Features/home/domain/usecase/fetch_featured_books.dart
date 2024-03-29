import 'package:cleanarcti/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarcti/Features/home/domain/repos/home_repo.dart';
import 'package:cleanarcti/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/dio_error_handler.dart';

class FetchFeaturedBookUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber=0]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
  }
}
