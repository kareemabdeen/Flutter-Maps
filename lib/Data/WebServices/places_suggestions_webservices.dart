import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_maps/constants/strings.dart';

class PlaceSuggestionsWebServices {
  late Dio dio;

  PlaceSuggestionsWebServices() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> fetchPlacesSuggestion(
      {required String userSearchInput,
      required String generatedSessionToken}) async {
    try {
      Response response = await dio.get(
        suggestionsBaseUrl,
        queryParameters: {
          'key': googleAPIKey,
          "input": userSearchInput,
          "components": "country:eg",
          "sessiontoken": generatedSessionToken,
          "type": "restaurant",
        },
      );
      return await response.data['predictions'];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }
}
