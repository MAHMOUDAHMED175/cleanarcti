import 'package:cleanarcti/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarcti/Features/home/domain/repos/home_repo.dart';
import 'package:cleanarcti/core/error/failure.dart';
import 'package:cleanarcti/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBookUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo homeRepo;

  FetchNewestBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([void parameter]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
