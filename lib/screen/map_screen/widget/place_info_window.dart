import 'package:flutter/material.dart';

import '../../../core/widgets/images/general_network_image.dart';
import '../../../model/filter_models.dart';
import '../../venue_details_screen/venue_details.dart';

class PlaceInfoWindow extends StatelessWidget {
  final Item place;

  const PlaceInfoWindow({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (c) => VenueDetailsScreen(
                venue:place           ),
          ),
        );
      },
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image at top
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: GeneralNetworkImage(
                  url:place.images.first.url ?? "",
                  width: 200,
                  height: 100,
                  boxFit: BoxFit.cover,
                ),
              ),

              // Title below
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  place.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}