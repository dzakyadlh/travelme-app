import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/custom_buttons.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/airplane.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Where do you want to be?',
              style: secondaryTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 32,
                shadows: [
                  const Shadow(
                    color: Colors.black38,
                    offset: Offset(2, 2),
                    blurRadius: 5,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Explore the world with us and let yourself have amazing experiences',
              style: secondaryTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 16,
                shadows: [
                  const Shadow(
                    color: Colors.black38,
                    offset: Offset(2, 2),
                    blurRadius: 5,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ExpandedFilledButton(
                buttonText: 'Get Started',
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                })
          ],
        ),
      ),
    );
  }
}
