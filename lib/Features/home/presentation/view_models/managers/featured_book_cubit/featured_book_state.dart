


import 'package:cleanarcti/Features/home/domain/entities/book_entity.dart';
abstract class FeaturedBookState {}

class FeaturedBookInitial extends FeaturedBookState {}
class FeaturedBookLoading extends FeaturedBookState {}
class FeaturedBookPaginationLoading extends FeaturedBookState {}
class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookEntity> books;

  FeaturedBookSuccess(this.books);
}
class FeaturedBookFailure extends FeaturedBookState {
  final String errMessage;

  FeaturedBookFailure(this.errMessage);

}class FeaturedBookPaginationFailure extends FeaturedBookState {
  final String errMessage;

  FeaturedBookPaginationFailure(this.errMessage);

}
