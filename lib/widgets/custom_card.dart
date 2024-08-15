import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';

class CustomBigCard extends StatelessWidget {
  const CustomBigCard({
    super.key,
    required this.cardTitle,
    required this.cardLocation,
    required this.cardRating,
    required this.cardImageUrl,
    required this.onTap,
  });

  final String cardTitle;
  final String cardLocation;
  final String cardRating;
  final String cardImageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(cardImageUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  cardTitle,
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
                      cardLocation,
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
                      size: 12,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      cardRating,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        shadows: [
                          Shadow(
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
    required this.cardTitle,
    required this.cardPrice,
    required this.cardRating,
    required this.cardImageUrl,
  });

  final String cardTitle;
  final String cardPrice;
  final String cardRating;
  final String cardImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: defaultMargin),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                  image: AssetImage(cardImageUrl), fit: BoxFit.fitWidth),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardTitle,
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '\$$cardPrice',
                style: priceTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 12,
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
                    cardRating,
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
