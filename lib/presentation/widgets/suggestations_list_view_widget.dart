import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Buisness_Logic/cubits/Maps_cubit/maps_cubit.dart';
import 'package:flutter_maps/Data/models/places_suggestations.dart';
import 'package:flutter_maps/helpers/maps_helper.dart';
import 'package:flutter_maps/presentation/widgets/suggestations_ltem_widget.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SuggestationListView extends StatefulWidget {
  const SuggestationListView({
    super.key,
    required this.suggestedPlaces,
    required this.searchController,
  });
  final List<PlacesSuggestations> suggestedPlaces;
  final FloatingSearchBarController searchController;

  @override
  State<SuggestationListView> createState() => _SuggestationListViewState();
}

class _SuggestationListViewState extends State<SuggestationListView> {
  late final PlacesSuggestations? selectedSuggestionPlace;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.suggestedPlaces.length,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            selectedSuggestionPlace = widget.suggestedPlaces[index];
            widget.searchController.close();
            storeSelectedplaceInCubit(context);
            getSelectedplaceLocation(context);
          },
          child: PlacesSuggestationsListItem(
            suggestion: widget.suggestedPlaces[index],
          ),
        );
      },
    );
  }

  void storeSelectedplaceInCubit(BuildContext context) {
    BlocProvider.of<MapsCubit>(context).selectedSuggestionPlace =
        selectedSuggestionPlace ??
            PlacesSuggestations(
              description: '',
              placeId: "",
            );
  }

  Future<void> getSelectedplaceLocation(BuildContext context) async {
    await BlocProvider.of<MapsCubit>(context).emitplaceDetailsLoaded(
        placeId: selectedSuggestionPlace!.placeId,
        generatedSessionToken: generateNewSessionToken());
  }
}
