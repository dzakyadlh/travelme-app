import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelme/providers/screen_provider.dart';
import 'package:travelme/screens/main/bookings.dart';
import 'package:travelme/screens/main/favorites.dart';
import 'package:travelme/screens/main/home.dart';
import 'package:travelme/screens/main/profile.dart';
import 'package:travelme/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List _screens = [
    const HomeScreen(),
    const BookingScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenProvider screenProvider = Provider.of(context);

    Widget customBottomNav() {
      return BottomAppBar(
        color: backgroundPrimaryColor,
        clipBehavior: Clip.antiAlias,
        child: Wrap(
          children: [
            BottomNavigationBar(
                backgroundColor: backgroundPrimaryColor,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: screenProvider.currentIndex,
                onTap: (value) {
                  screenProvider.currentIndex = value;
                },
                items: [
                  BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      screenProvider.currentIndex == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      size: 24,
                      color: tertiaryColor,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      screenProvider.currentIndex == 1
                          ? Icons.send_rounded
                          : Icons.send_outlined,
                      size: 24,
                      color: tertiaryColor,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      screenProvider.currentIndex == 2
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 24,
                      color: tertiaryColor,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      screenProvider.currentIndex == 3
                          ? Icons.person
                          : Icons.person_outline,
                      size: 24,
                      color: tertiaryColor,
                    ),
                  ),
                ])
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: customBottomNav(),
      body: SafeArea(child: _screens[screenProvider.currentIndex]),
    );
  }
}
