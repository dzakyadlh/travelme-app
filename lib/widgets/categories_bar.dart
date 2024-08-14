import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';

class CategoriesBar extends StatelessWidget {
  CategoriesBar({super.key});

  final List<String> categoryTitles = [
    "Mountain",
    "Hotel",
    "Restaurant",
    "Camping",
    "Beach",
    "Attraction",
  ];

  final List categoryIcons = [
    Image.asset(width: 20, 'assets/icons/mountains.png'),
    const Icon(size: 20, Icons.location_city_rounded),
    const Icon(size: 20, Icons.restaurant),
    Image.asset(width: 20, 'assets/icons/tent.png'),
    Image.asset(width: 20, 'assets/icons/beachball.png'),
    Image.asset(width: 20, 'assets/icons/castle.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(left: defaultMargin),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Category(
            title: categoryTitles[index],
            icon: categoryIcons[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor,
    this.onTap,
  });

  final String title;
  final dynamic icon;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: inactiveColor),
                  borderRadius: BorderRadius.circular(24)),
              child: Center(
                child: Row(
                  children: [
                    icon,
                    const SizedBox(
                      width: 8,
                    ),
                    Text(title),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
