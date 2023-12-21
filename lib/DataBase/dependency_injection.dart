import 'package:flutter_maps/Buisness_Logic/cubits/Maps_cubit/maps_cubit.dart';
import 'package:flutter_maps/Data/WebServices/places_suggestions_webservices.dart';
import 'package:flutter_maps/Data/repository/places_suggestations_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<PlaceSuggestionsWebServices>(
      PlaceSuggestionsWebServices());

  GetIt.I.registerLazySingleton<PlaceSuggestionsRepostory>(() =>
      PlaceSuggestionsRepostory(
          placeSuggestionsWebServices: getIt<PlaceSuggestionsWebServices>()));

  GetIt.I.registerLazySingleton<MapsCubit>(
      () => MapsCubit(getIt<PlaceSuggestionsRepostory>()));
}
