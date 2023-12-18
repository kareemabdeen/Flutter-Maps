import 'package:dio/dio.dart';

class PlaceSuggestionsWebServices {
  late Dio dio;

  PlaceSuggestionsWebServices() {
    BaseOptions options = BaseOptions(
      //  baseUrl: kBasicUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    dio = Dio(options);
  }

  // Future<List<dynamic>> placesSuggestion({required String userSearchInput}) async {
  //   try {
  //     Response response = dio.get(,queryParameters:);
  //   } catch (error) {
  //     log(error.toString());
  //   }
  // }
}
