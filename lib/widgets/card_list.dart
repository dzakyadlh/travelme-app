import 'package:flutter/material.dart';
import 'package:travelme/widgets/custom_card.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (_, index) {
        return const CustomSmallCard(
          cardTitle: 'Example',
          cardPrice: '735.00',
          cardRating: '5.0',
          cardImageUrl: 'assets/images/kiyomizu.png',
        );
      },
    );
  }
}
