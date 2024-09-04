import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/providers/wishlist_provider.dart';
import 'package:travelme/theme.dart';

class CustomBigCard extends StatelessWidget {
  const CustomBigCard({
    super.key,
    required this.hotel,
    required this.onTap,
  });

  final HotelModel hotel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(hotel.gallery[0].url),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  hotel.name,
                  style: secondaryTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 16,
                    shadows: [
                      const Shadow(
                        color: Colors.black38,
                        offset: Offset(1, 1),
                        blurRadius: 5,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
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
                        fontWeight: medium,
                        fontSize: 10,
                        shadows: [
                          const Shadow(
                            color: Colors.black38,
                            offset: Offset(1, 1),
                            blurRadius: 5,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: primaryColor,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      hotel.rating.toString(),
                      style: secondaryTextStyle.copyWith(
                        fontSize: 10,
                        shadows: [
                          const Shadow(
                            color: Colors.black38,
                            offset: Offset(1, 1),
                            blurRadius: 5,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSmallCard extends StatelessWidget {
  const CustomSmallCard({
    super.key,
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of(context);

    bool isWishlisted = wishlistProvider.isWishlisted(hotel);

    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage(hotel.gallery[0].url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: primaryColor,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      hotel.rating.toString(),
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          // IconButton(
          //   padding: EdgeInsets.zero,
          //   onPressed: () {
          //     wishlistProvider.setHotel(hotel);
          //   },
          //   icon: Icon(
          //     isWishlisted ? Icons.favorite : Icons.favorite_border,
          //     color: isWishlisted ? primaryColor : primaryTextColor,
          //   ),
          // )
        ],
      ),
    );
  }
}
