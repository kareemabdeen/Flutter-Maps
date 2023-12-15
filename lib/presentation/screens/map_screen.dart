import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_maps/helpers/location_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  }

  @override
  void initState() {
    super.initState();
    determineUserCurrentLocation();
  }

  static final CameraPosition currentUserCameraPosition = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  //! mapsScreenBody
  Widget buildMaps() {
    return GoogleMap(
      initialCameraPosition: currentUserCameraPosition,
      mapType: MapType.satellite,
      myLocationButtonEnabled: false,
      //*Callback method for when the map is ready to be used.
      //* Used to receive a [GoogleMapController] for this [GoogleMap].
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // in order to put the seachbar over the map screen
        children: [
          (position != null)
              ? buildMaps()
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
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
