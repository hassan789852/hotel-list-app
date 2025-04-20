import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_list_app/model/filter_models.dart';
import 'package:hotel_list_app/screen/map_screen/widget/place_info_window.dart';

import 'controller/map_controller.dart';

/// A standalone page that displays a Google Map with multiple markers.
///
/// Pass in a list of LatLng coordinates to show as pins on the map.
class MapPage extends ConsumerStatefulWidget {



  final List<Item> places;
  const MapPage({Key? key, required this.places}) : super(key: key);

  @override
  MapPageState createState() => MapPageState();

}

class MapPageState extends ConsumerState<MapPage> {
  @override
  Widget build(BuildContext context) {


      // Watch state with a family provider passing places
      final mapState = ref.watch(mapControllerProvider(widget.places));
      final mapCtrl = ref.read(mapControllerProvider(widget.places).notifier);

      // Build markers
      final markers = mapState.places.asMap().entries.map((e) {
        return Marker(
          markerId: MarkerId('marker_${e.key}'),
          position: LatLng(
            e.value.coordinates?.lat??0,
            e.value.coordinates?.lng??0,
          ),
          onTap: () {
            mapCtrl.onMarkerTap(e.key);
          },
        );
      }).toSet();

      // Initial camera
      final initialCam = CameraPosition(
        target: LatLng(
          widget.places[0].coordinates?.lat??0,
          widget.places[0].coordinates?.lng??0,
        ),
        zoom: 12,
      );

      return Scaffold(
        appBar: AppBar(title: const Text('Map')),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: initialCam,
              onMapCreated: mapCtrl.onMapCreated,
              markers: markers,
              onTap: (latLng) {

                mapCtrl.onMapTap(latLng);
              },
            ),

            // Custom info window overlay
            if ((mapState.selectedIndex??-1) >= 0 )
              Builder(builder: (innerCtx) {

                final idx = mapState.selectedIndex!;

                return Positioned(
                  left: 100,
                  top: 200,
                  child: PlaceInfoWindow(place: widget.places[idx]),
                );
              }),
          ],
        ),
      );

  }


}

