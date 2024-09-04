import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/widgets/custom_card.dart';

class CardList extends StatelessWidget {
  const CardList({
    super.key,
    required this.hotels,
  });

  final List<HotelModel> hotels;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: hotels.length,
      itemBuilder: (_, index) {
        return CustomSmallCard(
          hotel: hotels[index],
        );
      },
    );
  }
}
