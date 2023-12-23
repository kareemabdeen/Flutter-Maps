import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Buisness_Logic/cubits/Maps_cubit/maps_cubit.dart';
import 'package:flutter_maps/Data/models/places_suggestations.dart';
import 'package:flutter_maps/presentation/widgets/suggestations_list_view_widget.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SuggestationsBloc extends StatefulWidget {
  const SuggestationsBloc({super.key, required this.searchController});
  final FloatingSearchBarController searchController;
  @override
  State<SuggestationsBloc> createState() => _SuggestationsBlocState();
}

class _SuggestationsBlocState extends State<SuggestationsBloc> {
  late final List<PlacesSuggestations> places;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is PlacesLoaddedsuccesfully) {
          places = state.places;
          if (state.places.isNotEmpty) {
            SuggestationListView(
              suggestedPlaces: places,
              searchController: widget.searchController,
            );
          } else {
            return Container();
          }
        }
        return Container();
      },
    );
  }
}
