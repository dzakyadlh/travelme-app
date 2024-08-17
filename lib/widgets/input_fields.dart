import 'package:flutter/material.dart';
import 'package:travelme/theme.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.isObscureText,
    this.validator,
    this.fontSize = 14,
  });

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  final String? Function(String?)? validator;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText.toString(),
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: fontSize,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            obscureText: isObscureText,
            cursorColor: primaryTextColor,
            style: primaryTextStyle.copyWith(
              fontSize: fontSize,
            ),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: hintText,
                hintStyle: subtitleTextStyle.copyWith(
                  fontSize: fontSize,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 1.5,
                    ))),
            validator: validator,
          )
        ],
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            cursorColor: primaryTextColor,
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Search for a place...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                )),
          ),
        ],
      ),
    );
  }
}
