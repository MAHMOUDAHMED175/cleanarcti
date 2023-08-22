import 'package:dartz/dartz.dart';

import '../error/dio_error_handler.dart';

abstract class UseCase<Type, param> {
  //اليست يعنى اوبشنل يعنى ممكن مبعتهمش
  Future<Either<Failure, Type>> call([param parameter]);
}
