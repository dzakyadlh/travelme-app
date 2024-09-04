import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelme/providers/auth_provider.dart';
import 'package:travelme/providers/hotel_provider.dart';
import 'package:travelme/providers/screen_provider.dart';
import 'package:travelme/providers/wishlist_provider.dart';
import 'package:travelme/screens/checkout_success.dart';
import 'package:travelme/screens/landing.dart';
import 'package:travelme/screens/main.dart';
import 'package:travelme/screens/signin.dart';
import 'package:travelme/screens/signup.dart';
import 'package:travelme/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScreenProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => HotelProvider()),
      ],
      child: MaterialApp(
        title: 'Travelme',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/landing': (context) => const LandingScreen(),
          '/signin': (context) => const SigninScreen(),
          '/signup': (context) => const SignupScreen(),
          '/main': (context) => const MainScreen(),
          '/checkout_success': (context) => const CheckoutSuccessScreen(),
        },
      ),
    );
  }
}
