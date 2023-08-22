



import 'package:cleanarcti/Features/home/presentation/view_models/managers/featured_book_cubit/featured_book_cubit.dart';
import 'package:cleanarcti/Features/home/presentation/view_models/managers/featured_book_cubit/featured_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
import 'featured_books_list_view_loading_indicator.dart';
import 'featured_list_view.dart';

class FeatuedBooksListViewBlocBuilder extends StatefulWidget {
  const FeatuedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeatuedBooksListViewBlocBuilder> createState() =>
      _FeatuedBooksListViewBlocBuilderState();
}

class _FeatuedBooksListViewBlocBuilderState
    extends State<FeatuedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      listener: (context, state) {
        if (state is FeaturedBookSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBookPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text(state.errMessage)),
          );
        }
      },
      builder:(context, state) {
        if (state is FeaturedBookSuccess||state is FeaturedBookPaginationLoading ||state is FeaturedBookPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBookFailure) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(state.errMessage,style: const TextStyle(color: Colors.blue),),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}