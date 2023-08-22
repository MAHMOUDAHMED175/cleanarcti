import 'package:cleanarcti/Features/home/domain/usecase/fetch_featured_books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featuredBookUseCase) : super(FeaturedBookInitial());

  final FetchFeaturedBookUseCase featuredBookUseCase;
  List list = [];

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber==0) {
      emit(FeaturedBookLoading());
    }else{
      emit(FeaturedBookPaginationLoading());
    }

    var result = await featuredBookUseCase.call(pageNumber);
    result.fold((failure) {
      // print("${list}");
      if (pageNumber==0) {
        emit(FeaturedBookFailure(failure.message));
      }else{
        emit(FeaturedBookPaginationFailure(failure.message));
      }

    }, (books) {
      list = books;
      // print("${list}");
      emit(FeaturedBookSuccess(books));
    });
  }
}
