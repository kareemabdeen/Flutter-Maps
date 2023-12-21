import 'dart:developer';

import 'package:flutter_maps/Data/WebServices/places_suggestions_webservices.dart';
import 'package:flutter_maps/Data/models/places_suggestations.dart';

class PlaceSuggestionsRepostory {
  final PlaceSuggestionsWebServices placeSuggestionsWebServices;

  PlaceSuggestionsRepostory({required this.placeSuggestionsWebServices});

  Future<List<dynamic>> placesSuggestion(
      {required String userSearchInput,
      required String generatedSessionToken}) async {
    try {
      final List<dynamic> suggestations =
          await placeSuggestionsWebServices.fetchPlacesSuggestion(
        userSearchInput: userSearchInput,
        generatedSessionToken: generatedSessionToken,
      );
      return suggestations
          .map((predictionObject) =>
              PlacesSuggestations.fromJson(predictionObject))
          .toList();
    } catch (error) {
      log(error.toString());
      return [];
    }
  }
}
