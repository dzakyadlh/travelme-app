import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.leadingIcon,
    required this.labelText,
    required this.onPressed,
  });

  final IconData leadingIcon;
  final String labelText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              leadingIcon,
              color: primaryTextColor,
              size: 24,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                labelText,
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 13,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: secondaryColor,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
