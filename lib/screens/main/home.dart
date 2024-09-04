import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/models/user_model.dart';
import 'package:travelme/providers/auth_provider.dart';
import 'package:travelme/providers/hotel_provider.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/card_list.dart';
import 'package:travelme/widgets/card_slider.dart';
import 'package:travelme/widgets/input_fields.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;
    var firstName = (user.name.split(' '))[0];

    HotelProvider hotelProvider = Provider.of(context);
    List<HotelModel> hotels = hotelProvider.hotels;

    final searchController = TextEditingController(text: '');

    final hotel = HotelModel(
      id: 1,
      name: 'JW Marriott Hotel',
      location: 'Surabaya, Indonesia',
      price: 110.00,
      description:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Non, exercitationem error. Reprehenderit iste facilis laborum possimus atque, eaque velit temporibus cum iure distinctio nisi. Nisi cupiditate non eligendi est earum nam ut dolor voluptatem perspiciatis assumenda a, officiis saepe at hic accusantium impedit commodi labore itaque! Eveniet enim accusamus perspiciatis!',
      rating: 4.9,
      gallery: [
        'assets/images/jwmarriott.png',
      ],
    );

    Widget topBar() {
      return Padding(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/yunli.png'))),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Hello, $firstName!',
                  style: primaryTextStyle.copyWith(
                      fontWeight: semibold, fontSize: 14),
                ),
              ],
            ),
            const Icon(Icons.notifications_outlined),
          ],
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Text(
              'Where do you want to be today?',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 24,
              ),
            ),
            CustomSearchBar(
              controller: searchController,
            )
          ],
        ),
      );
    }

    Widget popularPlaces() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Places',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'See more',
                  style: subtitleTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
          BigCardSlider(hotel: hotel),
        ],
      );
    }

    Widget hotelsAround() {
      return Container(
        padding: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Packages',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 16,
              ),
            ),
            const CardList(),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          topBar(),
          header(),
          popularPlaces(),
          hotelsAround(),
        ],
      ),
    );
  }
}
