import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelme/providers/wishlist_provider.dart';
import 'package:travelme/providers/screen_provider.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/custom_buttons.dart';
import 'package:travelme/widgets/custom_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of(context);
    ScreenProvider screenProvider = Provider.of(context);

    Widget customTopBar() {
      return AppBar(
        backgroundColor: backgroundPrimaryColor,
        elevation: 0,
        title: Text(
          'Your Wishlists',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget wishlistList() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: ListView(
            children: wishlistProvider.wishlist
                .map(
                  (hotel) => CustomSmallCard(
                    hotel: hotel,
                  ),
                )
                .toList(),
          ),
        ),
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/persevering_face.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: defaultMargin,
              ),
              Text(
                'Your wishlist is empty!',
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Explore more hotels and add some of them to your wishlist',
                style: subtitleTextStyle.copyWith(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: defaultMargin,
              ),
              ExpandedFilledButton(
                buttonText: 'Explore Hotels',
                onPressed: () {
                  screenProvider.currentIndex = 0;
                },
              )
            ],
          ),
        ),
      );
    }

    return Container(
      color: backgroundPrimaryColor,
      child: Column(
        children: [
          customTopBar(),
          wishlistProvider.wishlist.isEmpty ? emptyWishlist() : wishlistList(),
        ],
      ),
    );
  }
}
