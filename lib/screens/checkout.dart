import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/models/user_model.dart';
import 'package:travelme/providers/auth_provider.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/booking_card.dart';
import 'package:travelme/widgets/custom_buttons.dart';
import 'package:travelme/widgets/input_fields.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.hotel,
    required this.bookingStartDate,
    required this.bookingEndDate,
  });

  final HotelModel hotel;
  final DateTime bookingStartDate;
  final DateTime bookingEndDate;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    UserModel user = authProvider.user;

    final contactNameController = TextEditingController(text: user.name);
    final phoneNumberController = TextEditingController(text: '');
    final emailController = TextEditingController(text: user.email);

    PreferredSizeWidget customTopBar() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          foregroundColor: primaryTextColor,
          backgroundColor: primaryColor,
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
          title: Text(
            'Checkout',
            style: primaryTextStyle.copyWith(
              fontWeight: semibold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    Widget header() {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        color: primaryColor,
        alignment: Alignment.center,
        child: BookingCard(
          hotelName: widget.hotel.name,
        ),
      );
    }

    Widget contactDetails() {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Details',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: defaultMargin,
              ),
              decoration: BoxDecoration(
                  color: backgroundPrimaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputField(
                    labelText: 'Name',
                    hintText: 'Contact\'s Name',
                    controller: contactNameController,
                    isObscureText: false,
                    fontSize: 12,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomInputField(
                    labelText: 'Phone Number',
                    hintText: 'Contact\'s Phone Number',
                    controller: phoneNumberController,
                    isObscureText: false,
                    fontSize: 12,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomInputField(
                    labelText: 'Email',
                    hintText: 'Contact\'s Email',
                    controller: emailController,
                    isObscureText: false,
                    fontSize: 12,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                  color: backgroundPrimaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose payment method',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ExpansionTile(
                    title: Text(
                      'Digital Wallet',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 12,
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          'Gopay',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/icons/gopay.png',
                          width: 40,
                          height: 40,
                        ),
                        trailing: Icon(
                          Icons.circle_outlined,
                          color: primaryTextColor,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'LinkAja',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/icons/linkaja.png',
                          width: 40,
                          height: 40,
                        ),
                        trailing: Icon(
                          Icons.circle_outlined,
                          color: primaryTextColor,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Dana',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/icons/dana.png',
                          width: 40,
                          height: 40,
                        ),
                        trailing: Icon(
                          Icons.circle_outlined,
                          color: primaryTextColor,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Paypal',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/icons/paypal.png',
                          width: 40,
                          height: 40,
                        ),
                        trailing: Icon(
                          Icons.circle_outlined,
                          color: primaryTextColor,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Google Pay',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/icons/googlepay.png',
                          width: 40,
                          height: 40,
                        ),
                        trailing: Icon(
                          Icons.circle_outlined,
                          color: primaryTextColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      'Virtual Account',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 12,
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          'Mandiri Virtual Account',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/icons/mandiri.png',
                          width: 40,
                          height: 40,
                        ),
                        trailing: Icon(
                          Icons.circle_outlined,
                          color: primaryTextColor,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'BCA Virtual Account',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/icons/bca.png',
                          width: 40,
                          height: 40,
                        ),
                        trailing: Icon(
                          Icons.circle_outlined,
                          color: primaryTextColor,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'BNI Virtual Account',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/icons/bni.png',
                          width: 40,
                          height: 40,
                        ),
                        trailing: Icon(
                          Icons.circle_outlined,
                          color: primaryTextColor,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'BRI Virtual Account',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/icons/bri.png',
                          width: 40,
                          height: 40,
                        ),
                        trailing: Icon(
                          Icons.circle_outlined,
                          color: primaryTextColor,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Mastercard',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/icons/mastercard.png',
                          width: 40,
                          height: 40,
                        ),
                        trailing: Icon(
                          Icons.circle_outlined,
                          color: primaryTextColor,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'VISA',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semibold,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.asset(
                          'assets/icons/visa.png',
                          width: 40,
                          height: 40,
                        ),
                        trailing: Icon(
                          Icons.circle_outlined,
                          color: primaryTextColor,
                          size: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget priceDetails() {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price Details',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rooms',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                Text(
                  '\$${widget.hotel.price.toString()}',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Taxes and administration fees',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                Text(
                  '\$${(widget.hotel.price * 0.1).toString()}',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                  ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '\$${(widget.hotel.price * 0.1 + widget.hotel.price).toString()}',
                  style: priceTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        child: ExpandedFilledButton(
          buttonText: 'Checkout',
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/checkout_success',
              (_) => false,
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: customTopBar(),
      backgroundColor: backgroundSecondaryColor,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            contactDetails(),
            paymentDetails(),
            priceDetails(),
            checkoutButton(),
          ],
        ),
      ),
    );
  }
}
