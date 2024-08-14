import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/card_list.dart';
import 'package:travelme/widgets/card_slider.dart';
import 'package:travelme/widgets/categories_bar.dart';
import 'package:travelme/widgets/input_fields.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController(text: '');

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
                  'Hello, Zeta!',
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

    Widget trendingPlace() {
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
                  'Trending Places',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 14,
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
          const BigCardSlider()
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          topBar(),
          header(),
          CategoriesBar(),
          trendingPlace(),
          const CardList(),
        ],
      ),
    );
  }
}
