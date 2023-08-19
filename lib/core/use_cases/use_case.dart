import 'package:cleanarcti/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, param> {
  //اليست يعنى اوبشنل يعنى ممكن مبعتهمش
  Future<Either<Failure, Type>> call([param parameter]);
}
