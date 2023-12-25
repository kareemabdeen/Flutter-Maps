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
      {required String userSearchInput, required String sessionToken}) async {
    try {
      Response response = await dio.get(
        suggestionsBaseUrl,
        queryParameters: {
          'key': googleAPIKey,
          "input": userSearchInput,
          'types': 'address',
          "components": "country:eg",
          "sessiontoken": sessionToken,
          //"type": "restaurant",
        },
      );
      log(response.data['predictions'].toString());

      return await response.data['predictions'];
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<dynamic> fetchPlaceLocation(
      {required String placeId, required String sessionToken}) async {
    try {
      Response response = await dio.get(
        placeDetailsBaseUrl,
        queryParameters: {
          'key': googleAPIKey,
          "place_id": placeId, //Todo:recheck for it later
          "sessiontoken": sessionToken,
        },
      );

      return await response.data;
    } catch (error) {
      return Future.error(error); //Todo later
    }
  }
}
