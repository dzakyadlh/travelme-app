import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/screens/detail.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/custom_card.dart';

class BigCardSlider extends StatelessWidget {
  const BigCardSlider({
    super.key,
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: defaultMargin),
      height: 240,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return CustomBigCard(
              cardTitle: hotel.name,
              cardLocation: hotel.location,
              cardRating: hotel.rating.toString(),
              cardImageUrl: hotel.gallery[0],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(hotel: hotel),
                  ),
                );
              },
            );
          }),
    );
  }
}
