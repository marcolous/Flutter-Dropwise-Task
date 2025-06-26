import 'package:farm_task/controllers/farm_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class FarmMapPage extends StatelessWidget {
  FarmMapPage({super.key});
  final controller = Get.put(FarmController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(
              () => GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: controller.farms.isNotEmpty
                      ? LatLng(
                          controller.farms.first.latitude,
                          controller.farms.first.longitude,
                        )
                      : const LatLng(34.0, 9.0),
                  zoom: 6,
                ),
                markers: Set<Marker>.of(controller.markers),
                onMapCreated: (GoogleMapController googleMapController) {
                  controller.mapController = googleMapController;
                },
              ),
            ),
            Positioned(
              top: -200,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(500),
                ),
              ),
            ),
            Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const Text(
                      'Farm Map',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                )),
            Positioned(
              top: 120,
              left: 20,
              right: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search farms...',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 180,
              right: 16,
              child: floatingButton(
                controller.zoomIn,
                Colors.blue[200],
                Icons.add,
              ),
            ),
            Positioned(
              bottom: 100,
              right: 16,
              child: floatingButton(
                controller.zoomOut,
                Colors.blue[200],
                Icons.remove,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 16,
              child: floatingButton(
                controller.goToUserLocation,
                Colors.green[200],
                Icons.location_on_outlined,
              ),
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton floatingButton(
    Function()? onPressed,
    Color? backgroundColor,
    IconData? icon,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
