import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/custom_buttons.dart';
import 'package:travelme/widgets/settings_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget customTopBar() {
      return AppBar(
        title: Text(
          'Your Profile',
          style: primaryTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 20,
          ),
        ),
        backgroundColor: backgroundPrimaryColor,
        elevation: 0,
      );
    }

    Widget header() {
      return Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/yunli.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Zeta Nyx',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Surabaya, Indonesia',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '0 Posts',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    child: Text(
                      'View my profile',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget logoutConfirmation() {
      return Container(
        height: MediaQuery.sizeOf(context).height * 0.45,
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Text(
              'Logout',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/worried_face.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              'Are you sure you want to log out of your account?',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PrimaryOutlinedButton(buttonText: 'Log Out', onPressed: () {}),
                PrimaryFilledButton(buttonText: 'Cancel', onPressed: () {}),
              ],
            ),
          ],
        ),
      );
    }

    Widget settings() {
      return Container(
        color: backgroundSecondaryColor,
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Payment Options',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundPrimaryColor,
              ),
              child: Column(
                children: [
                  SettingsButton(
                    leadingIcon: Icons.monetization_on_rounded,
                    labelText: 'Virtual Wallet',
                    onPressed: () {},
                  ),
                  SettingsButton(
                    leadingIcon: Icons.payment_rounded,
                    labelText: 'Banks and Credit Cards',
                    onPressed: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              'Member Features',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundPrimaryColor,
              ),
              child: Column(
                children: [
                  SettingsButton(
                    leadingIcon: Icons.monetization_on_outlined,
                    labelText: 'Rewards',
                    onPressed: () {},
                  ),
                  SettingsButton(
                    leadingIcon: Icons.assignment_return_rounded,
                    labelText: 'Returns and Refunds',
                    onPressed: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              'Customer Relationship',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundPrimaryColor,
              ),
              child: Column(
                children: [
                  SettingsButton(
                    leadingIcon: Icons.help_center_rounded,
                    labelText: 'Help Center',
                    onPressed: () {},
                  ),
                  SettingsButton(
                    leadingIcon: Icons.chat,
                    labelText: 'Contact Us',
                    onPressed: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              'Settings',
              style: primaryTextStyle.copyWith(
                fontWeight: semibold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundPrimaryColor,
              ),
              child: Column(
                children: [
                  SettingsButton(
                    leadingIcon: Icons.accessibility_new_rounded,
                    labelText: 'Accessibility',
                    onPressed: () {},
                  ),
                  SettingsButton(
                    leadingIcon: Icons.checklist_rounded,
                    labelText: 'Preferences',
                    onPressed: () {},
                  ),
                  SettingsButton(
                    leadingIcon: Icons.lock_person_rounded,
                    labelText: 'Privacy',
                    onPressed: () {},
                  ),
                  SettingsButton(
                    leadingIcon: Icons.notifications,
                    labelText: 'Notifications',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundPrimaryColor,
              ),
              child: Column(
                children: [
                  SettingsButton(
                    leadingIcon: Icons.logout_rounded,
                    labelText: 'Log Out',
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: backgroundPrimaryColor,
                          elevation: 0,
                          builder: (BuildContext context) {
                            return logoutConfirmation();
                          });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          customTopBar(),
          header(),
          settings(),
        ],
      ),
    );
  }
}
