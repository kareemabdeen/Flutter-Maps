import 'package:flutter/material.dart';
import 'package:flutter_maps/Data/models/places_suggestations.dart';
import 'package:flutter_maps/presentation/widgets/suggestations_ltem_widget.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SuggestationListView extends StatelessWidget {
  const SuggestationListView({
    super.key,
    required this.suggestedPlaces,
    required this.searchController,
  });
  final List<PlacesSuggestations> suggestedPlaces;
  final FloatingSearchBarController searchController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: suggestedPlaces.length,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            searchController.close();
          },
          child: PlacesSuggestationsListItem(
            suggestion: suggestedPlaces[index],
          ),
        );
      },
    );
  }
}
