import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/custom_buttons.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    Widget CustomTopBar() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: backgroundPrimaryColor,
                size: 24,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: backgroundPrimaryColor,
                size: 24,
              ),
            )
          ],
        ),
      );
    }

    Widget CustomBottomBar() {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${hotel.price} /night',
              style: secondaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: defaultMargin,
            ),
            PrimaryFilledButton(
              buttonText: 'Booking',
              onPressed: () {},
            )
          ],
        ),
      );
    }

    Widget detailCover() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 100,
          horizontal: defaultMargin,
        ),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('assets/images/jwmarriott.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black26,
                  BlendMode.darken,
                ))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              hotel.name,
              style: secondaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 24,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 12,
                  color: secondaryTextColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  hotel.location,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              hotel.description,
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: primaryColor,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      hotel.rating,
                      style: secondaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_downward_rounded,
                  color: backgroundPrimaryColor,
                  size: 20,
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget detailBody() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: defaultMargin),
        child: const Column(
          children: [],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          detailBody(),
          detailCover(),
          Align(
            alignment: Alignment.topCenter,
            child: CustomTopBar(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomBar(),
          )
        ],
      )),
    );
  }
}
