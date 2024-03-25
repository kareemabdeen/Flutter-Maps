import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Data/models/place_model.dart';
import '../../../Data/models/places_suggestations.dart';
import '../../../Data/repository/places_suggestations_repo.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final PlaceSuggestionsRepostory placesSuggestionsRepostory;
  late PlacesSuggestations selectedSuggestionPlace;
  late CameraPosition currentUserCameraPosition;
  Set<Marker>? markers;
  MapsCubit(this.placesSuggestionsRepostory) : super(MapsInitial());

  Future<void> emitplacesSuggestations(
      {required String userSearchInput,
      required String generatedSessionToken}) async {
    placesSuggestionsRepostory
        .placesSuggestion(
            userSearchInput: userSearchInput,
            generatedSessionToken: generatedSessionToken)
        .then(
          (placesSuggestationsResult) => {
            emit(
              PlacesLoaddedsuccesfully(places: placesSuggestationsResult),
            )
          },
        );
  }

  Future<void> emitplaceDetailsLoaded(
      {required String placeId, required String generatedSessionToken}) async {
    placesSuggestionsRepostory
        .fetchPlaceLocationDetails(
            placeId: placeId, sessionToken: generatedSessionToken)
        .then(
          (placeDetails) => {
            emit(
              PlaceDetailsLoadedSuccesfully(place: placeDetails),
            ),
          },
        );
  }

  void emitMarkersLoaded() {
    emit(MarkersLoaded(markers: markers ?? {}));
  }
}
