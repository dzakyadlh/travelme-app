import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.hotelName,
  });

  final String hotelName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultMargin),
      decoration: BoxDecoration(
        color: backgroundPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_city_rounded,
                color: primaryTextColor,
                size: 20,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                hotelName,
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 16,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1), // adjust the column widths as needed
              1: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                children: [
                  Text(
                    'Check-In',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '8 October 2024',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    'Check-Out',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '10 October 2024',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),
          Text(
            '1x Superior Bed',
            style: primaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Breakfast included for two people',
            style: subtitleTextStyle.copyWith(fontSize: 10),
          ),
          Text(
            '2 single bed',
            style: subtitleTextStyle.copyWith(fontSize: 10),
          ),
          Text(
            '2 guest rooms',
            style: subtitleTextStyle.copyWith(fontSize: 10),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.check_rounded,
                color: infoColor,
                size: 16,
              ),
              Text(
                'Free cancellation before 6 October 2024',
                style: InfoTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check_rounded,
                color: infoColor,
                size: 16,
              ),
              Text(
                'Reschedulable',
                style: InfoTextStyle.copyWith(
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
