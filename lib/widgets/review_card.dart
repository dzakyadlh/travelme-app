import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';

class CustomReviewCard extends StatelessWidget {
  const CustomReviewCard({
    super.key,
    required this.cardName,
    required this.cardRating,
    required this.cardReview,
    required this.cardDate,
    required this.cardImageUrl,
  });

  final String cardName;
  final double cardRating;
  final String cardReview;
  final String cardDate;
  final String cardImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: subtitleTextColor),
                image: DecorationImage(
                  image: AssetImage(cardImageUrl),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        cardName,
                        style: primaryTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      cardDate,
                      style: subtitleTextStyle.copyWith(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: List.generate(
                    cardRating.round(),
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Icon(
                        Icons.star_rounded,
                        color: primaryColor,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  cardReview,
                  style: primaryTextStyle.copyWith(
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
