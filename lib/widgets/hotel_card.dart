import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/theme.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
      padding: EdgeInsets.all(defaultMargin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(hotel.gallery[0]),
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.black26,
                BlendMode.darken,
              ))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hotel.name,
            style: secondaryTextStyle.copyWith(
              fontWeight: semibold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 8,
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
            height: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: primaryColor,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                hotel.rating.toString(),
                style: secondaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
