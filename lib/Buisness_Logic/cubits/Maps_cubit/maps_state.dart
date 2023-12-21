part of 'maps_cubit.dart';

@immutable
sealed class MapsState {}

final class MapsInitial extends MapsState {}

final class PlacesLoaddedsuccesfully extends MapsState {
  //todo: List<dynamic>
  final List<PlacesSuggestations> placesSuggestationsResults;

  PlacesLoaddedsuccesfully({required this.placesSuggestationsResults});
}
