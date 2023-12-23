import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Buisness_Logic/cubits/Maps_cubit/maps_cubit.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:flutter_maps/presentation/widgets/suggestations_bloc_widget.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:uuid/uuid.dart';

class CustomFloatingSearchBar extends StatefulWidget {
  const CustomFloatingSearchBar({super.key});

  @override
  State<CustomFloatingSearchBar> createState() =>
      _CustomFloatingSearchBarState();
}

class _CustomFloatingSearchBarState extends State<CustomFloatingSearchBar> {
  final FloatingSearchBarController _searchController =
      FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      controller: _searchController,
      elevation: 6,
      onQueryChanged: (query) {
        //Todo:Dont forget to generate sessionToken each time user write of the searchBar in order not to be charded out of free billing
        getplacesSuggestations(query: query);
      },
      hintStyle: const TextStyle(fontSize: 18),
      queryStyle: const TextStyle(fontSize: 18),
      hint: 'Find a place..',
      border: const BorderSide(style: BorderStyle.none),
      margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      height: 52,
      iconColor: MyColors.blue,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: Icon(
              Icons.place,
              color: Colors.black.withOpacity(0.6),
            ),
            onPressed: () {},
          ),
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SuggestationsBloc(
                searchController: _searchController,
              ),
            ],
          ),
        );
      },
    );
  }

  void getplacesSuggestations({required String query}) {
    //Todo: import Uuid library to my yaml
    final sessionToken = const Uuid().v4();
    BlocProvider.of<MapsCubit>(context).emitplacesSuggestations(
        userSearchInput: query, generatedSessionToken: sessionToken);
  }
}
