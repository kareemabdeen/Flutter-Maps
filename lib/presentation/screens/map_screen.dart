import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:flutter_maps/helpers/location_helper.dart';
import 'package:flutter_maps/presentation/widgets/custom_drawer_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static Position? position;

  Future<void> determineUserCurrentLocation() async {
    position = await LocationHelper.detremineUserCurrentLocation().whenComplete(
      () {
        setState(
          () {
            // rebuild for the screen to update user current location on map .
          },
        );
      },
    );
    // log("${position!.latitude}msaaaaaa");
    // log(position!.latitude.toString());
  }

  @override
  void initState() {
    super.initState();
    determineUserCurrentLocation();
  }

  static final CameraPosition currentUserCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  //! mapsScreenBody
  Widget buildMaps() {
    return GoogleMap(
      initialCameraPosition: currentUserCameraPosition,
      mapType: MapType.normal,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      myLocationEnabled: true, // circled blue point on my map
      //*Callback method for when the map is ready to be used.
      //* Used to receive a [GoogleMapController] for this [GoogleMap].
      onMapCreated: (GoogleMapController controller) {
        //*All listeners on the future are informed about the value. => _mapController.future;
        _mapController.complete(controller);
      },
    );
  }

  final FloatingSearchBarController _searchController =
      FloatingSearchBarController();

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      controller: _searchController,
      elevation: 6,
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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Stack(
        // in order to put the seachbar over the map screen
        fit: StackFit.expand, //*FloatingSearchBar docs
        children: [
          (position != null)
              ? buildMaps()
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
          buildFloatingSearchBar(),
        ],
      ),
      floatingActionButton: buildFloatingActionPoint(),
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    // called when onMapCreated function is done and map screen is build with its appropriate enviroment
    final GoogleMapController controller = await _mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(currentUserCameraPosition),
    );
  }

  //Todo: make it stateless one
  Widget buildFloatingActionPoint() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
      child: FloatingActionButton(
        onPressed: _goToMyCurrentLocation,
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.place,
          color: Colors.white,
        ),
      ),
    );
  }
}
