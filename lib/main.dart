import 'package:cleanarcti/Features/home/data/repos/home_repos.dart';
import 'package:cleanarcti/Features/home/domain/entities/book_entity.dart';
import 'package:cleanarcti/Features/home/domain/usecase/fetch_featured_books.dart';
import 'package:cleanarcti/Features/home/domain/usecase/fetch_newest_books.dart';
import 'package:cleanarcti/Features/home/presentation/view_models/managers/featured_book_cubit/featured_book_cubit.dart';
import 'package:cleanarcti/Features/home/presentation/view_models/managers/newest_book_cubit/newest_book_cubit.dart';
import 'package:cleanarcti/core/utils/Bloc_observer.dart';
import 'package:cleanarcti/core/utils/functions/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';

Future main() async {
  serviceLocatorMethod();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeaturedBookCubit(
            FetchFeaturedBookUseCase(
              locator.get<HomeRepositoryImpl>(),
            ),
          )..fetchFeaturedBooks();
        }),
        BlocProvider(create: (context) {
          return NewestBookCubit(
            FetchNewestBookUseCase(
              locator.get<HomeRepositoryImpl>(),
            ),
          );
        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
