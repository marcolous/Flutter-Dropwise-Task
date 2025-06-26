// ignore_for_file: deprecated_member_use

import 'package:farm_task/models/farm_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FarmController extends GetxController {
  GoogleMapController? mapController;
  late BitmapDescriptor customIcon;

  final farms = <Farm>[
    Farm(
      farmId: 1,
      name: 'Olive Farm',
      governorate: 'Mahdia',
      delegation: 'Mahdia',
      latitude: 35.5047,
      longitude: 11.0622,
    ),
    Farm(
      farmId: 2,
      name: 'Cactus Farm',
      governorate: 'Bizerte',
      delegation: 'Zarzouna',
      latitude: 37.2798,
      longitude: 9.8671,
    ),
    Farm(
      farmId: 3,
      name: 'Tomato Farm',
      governorate: 'Sfax',
      delegation: 'Agareb',
      latitude: 34.7212,
      longitude: 10.7584,
    ),
    Farm(
      farmId: 4,
      name: 'Wheat Farm',
      governorate: 'Kairouan',
      delegation: 'Sbikha',
      latitude: 35.6716,
      longitude: 10.1015,
    ),
    Farm(
      farmId: 5,
      name: 'Palm Farm',
      governorate: 'Tozeur',
      delegation: 'Degache',
      latitude: 33.9181,
      longitude: 8.1335,
    ),
  ].obs;

  final markers = <Marker>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCustomIcon();
    // _generateMarkers();
  }

  void zoomIn() async {
    final zoom = await mapController?.getZoomLevel() ?? 14;
    mapController?.animateCamera(CameraUpdate.zoomTo(zoom + 1));
  }

  void zoomOut() async {
    final zoom = await mapController?.getZoomLevel() ?? 14;
    mapController?.animateCamera(CameraUpdate.zoomTo(zoom - 1));
  }

  void goToUserLocation() {}

  void _loadCustomIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(40, 40)),
      'assets/farmer-3.png',
    );
    _generateMarkers();
  }

  void _generateMarkers() {
    markers.clear();
    for (var farm in farms) {
      markers.add(
        Marker(
          markerId: MarkerId(farm.farmId.toString()),
          position: LatLng(farm.latitude, farm.longitude),
          icon: customIcon,
          infoWindow: InfoWindow(
            title: farm.name,
            snippet: '${farm.governorate} - ${farm.delegation}',
          ),
        ),
      );
    }
  }
}
