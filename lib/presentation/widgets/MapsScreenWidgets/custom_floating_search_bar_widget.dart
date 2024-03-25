import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import '../../../Buisness_Logic/cubits/Maps_cubit/maps_cubit.dart';
import '../../../Data/models/place_model.dart';
import '../../../DataBase/dependency_injection.dart';
import '../../../constants/my_colors.dart';
import '../../../helpers/maps_helper.dart';
import '../MapsScreenWidgets/suggestations_bloc_widget.dart';

class CustomFloatingSearchBar extends StatefulWidget {
  const CustomFloatingSearchBar({
    super.key,
    required this.mapController,
  });
  final Completer<GoogleMapController> mapController;

  @override
  State<CustomFloatingSearchBar> createState() =>
      _CustomFloatingSearchBarState();
}

class _CustomFloatingSearchBarState extends State<CustomFloatingSearchBar> {
  final FloatingSearchBarController _searchController =
      FloatingSearchBarController();
  late Set<Marker> markers = {};
  late Place placeDetails;
  late CameraPosition selectedPlaceCameraPosition;

  late Marker searchedPlaceMarker; // Todo : Late intialization error
  late Marker currentLoactionMarker;

  void buildNewCameraPosition(
      {required double latitude, required double longitude}) {
    selectedPlaceCameraPosition = CameraPosition(
      bearing: 0.0,
      target: LatLng(latitude, longitude),
      tilt: 0.0,
      zoom: 17,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    GlobalKey<FormState> floatingSearckKey = GlobalKey();
    return FloatingSearchBar(
      key: floatingSearckKey,
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
              buildSelectedPlaceDetailsBloc(),
              buildMarkerBloc(),
            ],
          ),
        );
      },
    );
  }

  void getplacesSuggestations({required String query}) {
    BlocProvider.of<MapsCubit>(context).emitplacesSuggestations(
      userSearchInput: query,
      generatedSessionToken: generateNewSessionToken(),
    );
  }

  Widget buildSelectedPlaceDetailsBloc() {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is PlaceDetailsLoadedSuccesfully) {
          placeDetails = (state).place;
          goToSearchedLocationOnMap(state);
        }
      },
      child:
          Container(), //Todo fix child added any thing in order not to throw exception
    );
  }

  Future<void> goToSearchedLocationOnMap(
      PlaceDetailsLoadedSuccesfully state) async {
    buildNewCameraPosition(
      latitude: (state).place.result.geometry.location.lat,
      longitude: (state).place.result.geometry.location.lng,
    );
    final GoogleMapController controller = await widget.mapController
        .future; //passed from mapScreen which is the main controller
    await controller.animateCamera(
        CameraUpdate.newCameraPosition(selectedPlaceCameraPosition));
    buildSearchedPlaceMarker();
  }

  void buildSearchedPlaceMarker() {
    searchedPlaceMarker = Marker(
      markerId: const MarkerId('2'),
      position: selectedPlaceCameraPosition
          .target, //* get the The geographical location that the camera is pointing at.
      onTap: () {
        buildCurrentLocationMarker();
      },
      infoWindow: const InfoWindow(
        title: "your searched place",
        snippet: "kimo is done ",
      ),
      // icon: (BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)),
    );
    addMarkerToMarkersSetAndUpdateUi(marker: searchedPlaceMarker);
  }

  void addMarkerToMarkersSetAndUpdateUi({required Marker marker}) {
    markers.add(marker);
    context.read<MapsCubit>().markers = markers;
    //`BlocProvider.of<MapsCubit>(context).markers = markers;
    BlocProvider.of<MapsCubit>(context).emitMarkersLoaded();
  }

  void buildCurrentLocationMarker() {
    currentLoactionMarker = Marker(
      markerId: const MarkerId('1'),
      position:
          BlocProvider.of<MapsCubit>(context).currentUserCameraPosition.target,
      icon: (BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)),
      infoWindow: const InfoWindow(
        title: "Your Current Location",
      ),
    );
    addMarkerToMarkersSetAndUpdateUi(marker: currentLoactionMarker);
  }

  Widget buildMarkerBloc() {
    return BlocBuilder<MapsCubit, MapsState>(
      bloc: getIt<MapsCubit>(),
      builder: (context, state) {
        if (state is MarkersLoaded) {
          markers = (state).markers;
          log('======================= $markers');
        }
        return Container();
      },
    );
  }
}

// //! refactored code
// class SelectedPlaceDetailsBloc extends StatefulWidget {
//   const SelectedPlaceDetailsBloc({super.key});

//   @override
//   State<SelectedPlaceDetailsBloc> createState() =>
//       _SelectedPlaceDetailsBlocState();
// }

// class _SelectedPlaceDetailsBlocState extends State<SelectedPlaceDetailsBloc> {
//   late Place placeDetails;

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<MapsCubit, MapsState>(
//       listener: (context, state) {
//         if (state is PlaceDetailsLoadedSuccesfully) {
//           placeDetails = (state).place;
//           goToSearchedLocationOnMap(state);

//         }
//       },
//       child:
//           Container(), //Todo fix child added any thing in order not to throw exception
//     );
//   }

// }
