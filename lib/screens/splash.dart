import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushNamed(context, '/landing');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundTertiaryColor,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icons/logodark.png'))),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'TRAVELME',
                style: primaryTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 32,
                  letterSpacing: 10,
                ),
              )
            ]),
      ),
    );
  }
}
