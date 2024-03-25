import 'dart:developer';

import '../WebServices/places_suggestions_webservices.dart';
import '../models/place_model.dart';
import '../models/places_suggestations.dart';

class PlaceSuggestionsRepostory {
  final PlaceSuggestionsWebServices placeSuggestionsWebServices;

  PlaceSuggestionsRepostory({required this.placeSuggestionsWebServices});

  Future<List<PlacesSuggestations>> placesSuggestion(
      {required String userSearchInput,
      required String generatedSessionToken}) async {
    try {
      final List<dynamic> suggestations =
          await placeSuggestionsWebServices.fetchPlacesSuggestion(
        userSearchInput: userSearchInput,
        sessionToken: generatedSessionToken,
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

  Future<Place> fetchPlaceLocationDetails(
      {required String placeId, required String sessionToken}) async {
    final place = await placeSuggestionsWebServices.fetchPlaceLocation(
      placeId: placeId,
      sessionToken: sessionToken,
    );
    return Place.fromJson(place);
  }
}
