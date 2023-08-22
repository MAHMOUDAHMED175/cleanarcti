import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  final baseUrl = "https://www.googleapis.com/books/v1/";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
  // static Future<Response> getData({
  //   required String endPoint,
  //   Map<String, dynamic>? query,
  //   String lang = 'en',
  //   //  String? token,
  // }) async {
  //   dio.options.headers = {
  //     "Content-Type": "application/json",
  //     "lang": lang,
  //     // "Authorization":token!,
  //   };
  //   return await dio.get(
  //     endPoint,
  //     queryParameters: query,
  //   );
  // }

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
