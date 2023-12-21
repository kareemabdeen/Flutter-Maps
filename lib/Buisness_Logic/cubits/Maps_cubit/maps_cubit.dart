import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Data/models/places_suggestations.dart';
import 'package:flutter_maps/Data/repository/places_suggestations_repo.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final PlaceSuggestionsRepostory placesSuggestionsRepostory;

  MapsCubit(this.placesSuggestionsRepostory) : super(MapsInitial());

  Future<void> emitplacesSuggestations(
      {required String userSearchInput,
      required String generatedSessionToken}) async {
    placesSuggestionsRepostory
        .placesSuggestion(
            userSearchInput: userSearchInput,
            generatedSessionToken: generatedSessionToken)
        .then((placesSuggestationsResult) => {
              emit(PlacesLoaddedsuccesfully(
                  placesSuggestationsResults:
                      placesSuggestationsResult as List<PlacesSuggestations>))
            });
  }
}
