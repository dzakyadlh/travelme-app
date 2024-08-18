import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/custom_buttons.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/icons/cheers.png'),
                    fit: BoxFit.cover,
                  )),
                ),
              ],
            ),
            const SizedBox(
              height: 56,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booked',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 32,
                  ),
                ),
                Text(
                  'Successfully',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 32,
                  ),
                )
              ],
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              'Get everything ready until it\'s time to go for the trip!',
              style: subtitleTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 64,
            ),
            ExpandedFilledButton(
                buttonText: 'Explore other places',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/main',
                    (_) => false,
                  );
                })
          ],
        ),
      ),
    );
  }
}
