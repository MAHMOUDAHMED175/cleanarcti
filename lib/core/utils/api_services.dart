import 'package:dio/dio.dart';

class ApiService {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://www.googleapis.com/books/v1/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    //  String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
      "lang": lang,
      // "Authorization":token!,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  // static Future<Response> postData({
  //   required String url,
  //   Map<String,dynamic>? query,
  //   required Map<String,dynamic> data,
  //   String lang='en',
  //   String? token,
  // })async{
  //   dio.options.headers={
  //     "Content-Type":"application/json",
  //     "lang":lang,
  //     "Authorization":token!,
  //   };
  //   return await dio.post(
  //     url,
  //     queryParameters: query,
  //     data: data
  //   );
  // }

  // //هيحط داتا مكان داتا ويستبدلها update
  // static Future<Response> putData(
  //     {
  //       required String url,
  //       Map<String,dynamic>? query,
  //       required Map<String,dynamic> data,
  //       String lang='en',
  //       String? token,
  //     })async{
  //   dio.options.headers= {
  //     'lang':lang,
  //     'Authorization':token!,
  //     'Content-Type':'application/json',

  //   };
  //   return await dio.put(
  //     url,
  //     queryParameters: query,
  //     data: data,
  //   );

  // }
}