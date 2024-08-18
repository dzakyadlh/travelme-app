import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/widgets/custom_card.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    final hotel = HotelModel(
      id: 1,
      name: 'Four Points by Sheraton',
      location: 'Surabaya',
      price: 132.00,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus velit ipsam suscipit, optio consequuntur molestias odio modi corrupti reprehenderit rerum nulla est aperiam iure qui illo quia ullam impedit accusantium libero accusamus animi numquam magni iste fuga. Deserunt praesentium nihil dicta sunt asperiores, quasi qui et quidem omnis. In, saepe?',
      rating: 4.8,
      gallery: ['assets/images/kiyomizu.png'],
    );

    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (_, index) {
        return CustomSmallCard(
          hotel: hotel,
        );
      },
    );
  }
}
