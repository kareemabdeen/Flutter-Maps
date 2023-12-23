import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_maps/helpers/location_helper.dart';
import 'package:flutter_maps/presentation/widgets/custom_drawer_widget.dart';
import 'package:flutter_maps/presentation/widgets/custom_floating_button_widget.dart';
import 'package:flutter_maps/presentation/widgets/custom_floating_search_bar_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static Position? position;
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>(); //Todo : should be closed

  static final CameraPosition currentUserCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

  @override
  void initState() {
    super.initState();
    determineUserCurrentLocation();
  }

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
          const CustomFloatingSearchBar(),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: _goToMyCurrentLocation, //! its working right without ()=>
      ),
    );
  }

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
  }

  Future<void> _goToMyCurrentLocation() async {
    // called when onMapCreated function is done and map screen is build with its appropriate enviroment
    final GoogleMapController controller = await _mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(currentUserCameraPosition),
    );
  }
}
