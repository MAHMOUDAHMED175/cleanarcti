import 'package:cleanarcti/Features/home/data/data_sources/home_local_data.dart';
import 'package:cleanarcti/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:cleanarcti/Features/home/data/repos/home_repos.dart';
import 'package:cleanarcti/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void serviceLocatorMethod() {
  locator.registerSingleton<ApiService>(ApiService(Dio()));
  locator.registerSingleton<HomeRepositoryImpl>(
    HomeRepositoryImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        locator.get<ApiService>(),
      ),
    ),
  );
}
