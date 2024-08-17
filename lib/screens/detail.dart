import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/custom_buttons.dart';
import 'package:travelme/widgets/custom_card.dart';
import 'package:travelme/widgets/custom_date_picker.dart';
import 'package:travelme/widgets/gallery.dart';
import 'package:travelme/widgets/hotel_card.dart';
import 'package:travelme/widgets/location_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _showDetailBody = false;

  @override
  Widget build(BuildContext context) {
    Widget CustomTopBar() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 16,
        ),
        color: _showDetailBody ? backgroundPrimaryColor : Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: _showDetailBody ? primaryTextColor : secondaryTextColor,
                size: 24,
              ),
            ),
            Text(
              _showDetailBody ? widget.hotel.name : '',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 16,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: _showDetailBody ? primaryTextColor : secondaryTextColor,
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
        color: _showDetailBody ? backgroundPrimaryColor : Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${widget.hotel.price} /night',
              style: (_showDetailBody ? primaryTextStyle : secondaryTextStyle)
                  .copyWith(
                fontWeight: semibold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: defaultMargin,
            ),
            PrimaryFilledButton(
              buttonText: 'Booking',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      child: CustomDatePicker(
                        hotel: widget.hotel,
                      ),
                    );
                  },
                );
              },
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
              widget.hotel.name,
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
                  widget.hotel.location,
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
              widget.hotel.description,
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
                      widget.hotel.rating.toString(),
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

    Widget detailAbout() {
      return Container(
        padding: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Hotel',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              widget.hotel.description,
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 12,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    Widget detailGallery() {
      return Container(
        padding: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gallery',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Gallery(imageList: widget.hotel.gallery)
          ],
        ),
      );
    }

    Widget detailLocation() {
      return Container(
        padding: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const LocationWidget(address: ''),
          ],
        ),
      );
    }

    Widget detailReviews() {
      return Container(
        padding: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reviews',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
            const CustomReviewCard(
              cardName: 'Rey Schneider',
              cardRating: 4.9,
              cardReview:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora expedita repellat totam molestias beatae fugiat deserunt quibusdam cumque numquam! Nihil!',
              cardDate: 'Today',
              cardImageUrl: 'assets/images/rome.png',
            ),
            const CustomReviewCard(
              cardName: 'Rey Schneider',
              cardRating: 4.9,
              cardReview:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora expedita repellat totam molestias beatae fugiat deserunt quibusdam cumque numquam! Nihil!',
              cardDate: 'Today',
              cardImageUrl: 'assets/images/rome.png',
            ),
            const CustomReviewCard(
              cardName: 'Rey Schneider',
              cardRating: 4.9,
              cardReview:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora expedita repellat totam molestias beatae fugiat deserunt quibusdam cumque numquam! Nihil!',
              cardDate: 'Today',
              cardImageUrl: 'assets/images/rome.png',
            ),
          ],
        ),
      );
    }

    Widget detailBody() {
      return SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.symmetric(vertical: 100, horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HotelCard(hotel: widget.hotel),
              detailAbout(),
              detailGallery(),
              detailLocation(),
              detailReviews(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: GestureDetector(
                      onVerticalDragUpdate: (details) {
                        if (details.delta.dy > 0) {
                          setState(() {
                            _showDetailBody = true;
                          });
                        }
                      },
                      child: AnimatedCrossFade(
                        firstChild: detailCover(),
                        secondChild: detailBody(),
                        crossFadeState: _showDetailBody
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 500),
                      )),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CustomTopBar(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomBar(),
            )
          ],
        ),
      ),
    );
  }
}
