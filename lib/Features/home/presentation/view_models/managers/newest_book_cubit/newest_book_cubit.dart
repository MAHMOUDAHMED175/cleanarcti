import 'package:bloc/bloc.dart';
import 'package:cleanarcti/Features/home/domain/usecase/fetch_newest_books.dart';

import 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.fetchNewestBookUseCase) : super(NewestBookInitial());


  final FetchNewestBookUseCase fetchNewestBookUseCase;
  List list = [];

  Future<void> fetchFeaturedBooks() async {
    emit(NewestBookLoading());

    var result = await fetchNewestBookUseCase.call();
    result.fold((failure) {
      emit(NewestBookFailure(failure.message));
    }, (books) {
      list = books;
      print("${list}ssssssssssssssssssssssssss");
      emit(NewestBookSuccess(books));
    });
  }
}
