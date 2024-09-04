import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_gallery_model.dart';

class Gallery extends StatelessWidget {
  const Gallery({
    super.key,
    required this.gallery,
  });

  final List<HotelGalleryModel> gallery;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gallery.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(gallery[index].url),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
