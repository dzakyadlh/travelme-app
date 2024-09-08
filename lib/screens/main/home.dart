import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/models/user_model.dart';
import 'package:travelme/providers/auth_provider.dart';
import 'package:travelme/providers/hotel_provider.dart';
import 'package:travelme/providers/location_provider.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/card_list.dart';
import 'package:travelme/widgets/card_slider.dart';
import 'package:travelme/widgets/input_fields.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _getUserLocationAndHotels();
  }

  Future<void> _getUserLocationAndHotels() async {
    LocationProvider locationProvider = Provider.of(context);
    HotelProvider hotelProvider = Provider.of(context);

    bool isPermissionGranted =
        await locationProvider.requestLocationPermission();

    if (isPermissionGranted) {
      await locationProvider.getUserPosition();
      Position position = locationProvider.position;

      DateTime checkIn = DateTime.now();
      DateTime checkOut = checkIn.add(const Duration(days: 7));

      await hotelProvider.getHotelsByCoordinates(
          position.latitude, position.longitude, checkIn, checkOut);
    } else {
      debugPrint('Location permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;
    var firstName = (user.name.split(' '))[0];

    HotelProvider hotelProvider = Provider.of(context);
    List<HotelModel> hotels = hotelProvider.hotels;

    final searchController = TextEditingController(text: '');

    Widget topBar() {
      return Padding(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(user.photoUrl.toString()))),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Hello, $firstName!',
                  style: primaryTextStyle.copyWith(
                      fontWeight: semibold, fontSize: 14),
                ),
              ],
            ),
            const Icon(Icons.notifications_outlined),
          ],
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Text(
              'Where do you want to be today?',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 24,
              ),
            ),
            CustomSearchBar(
              controller: searchController,
            )
          ],
        ),
      );
    }

    Widget popularPlaces(hotels) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Places',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'See more',
                  style: subtitleTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
          BigCardSlider(hotels: hotels),
        ],
      );
    }

    Widget hotelsAround(hotels) {
      return Container(
        padding: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Packages',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 16,
              ),
            ),
            CardList(hotels: hotels),
          ],
        ),
      );
    }

    return hotels.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                topBar(),
                header(),
                popularPlaces(hotels),
                hotelsAround(hotels),
              ],
            ),
          );
  }
}
