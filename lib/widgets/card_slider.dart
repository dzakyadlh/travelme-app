import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/custom_card.dart';

class BigCardSlider extends StatelessWidget {
  const BigCardSlider({super.key});

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
            return const CustomBigCard(
              cardTitle: 'Gardens at Bay',
              cardLocation: 'Singapore',
              cardRating: '4.9',
              cardImageUrl: 'assets/images/gardensbay.png',
            );
          }),
    );
  }
}
