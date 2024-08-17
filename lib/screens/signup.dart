import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:travelme/theme.dart';
import 'package:travelme/widgets/custom_buttons.dart';
import 'package:travelme/widgets/input_fields.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    signup() async {
      setState(() {
        isLoading = true;
      });
      Navigator.pushNamedAndRemoveUntil(context, '/main', (_) => false);
      setState(() {
        isLoading = false;
      });
    }

    handleSignup() {
      if (_formKey.currentState!.validate()) {
        signup();
      }
    }

    Widget title() {
      return Text(
        'Sign Up',
        style: primaryTextStyle.copyWith(fontWeight: semibold, fontSize: 24),
        textAlign: TextAlign.center,
      );
    }

    Widget signupButton() {
      return ExpandedFilledButton(
          buttonText: 'Sign Up',
          onPressed: () {
            handleSignup();
          });
    }

    Widget alternativeSign() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Dash(
                direction: Axis.horizontal,
                length: 70,
                dashLength: 70,
                dashColor: primaryTextColor,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Or sign up with',
                style:
                    primaryTextStyle.copyWith(fontSize: 14, fontWeight: light),
              ),
              const SizedBox(
                width: 4,
              ),
              Dash(
                direction: Axis.horizontal,
                length: 70,
                dashLength: 70,
                dashColor: primaryTextColor,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                label: Text(
                  'Google',
                  style: primaryTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 16,
                  ),
                ),
                icon: Image.asset(
                  'assets/icons/google.png',
                  width: 24,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                label: Text(
                  'Facebook',
                  style: primaryTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 16,
                  ),
                ),
                icon: Image.asset(
                  'assets/icons/facebook.png',
                  width: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: primaryTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 14,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Text(
                    'Sign In',
                    style: priceTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14,
                    ),
                  ))
            ],
          )
        ],
      );
    }

    Widget input_contents() {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        alignment: Alignment.center,
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                title(),
                SizedBox(
                  height: defaultMargin,
                ),
                CustomInputField(
                  labelText: 'Full Name',
                  hintText: 'Your full name',
                  controller: nameController,
                  isObscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    } else if (value.length < 3) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  labelText: 'Email',
                  hintText: 'Your email address',
                  controller: emailController,
                  isObscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  labelText: 'Password',
                  hintText: 'Your account password',
                  controller: passwordController,
                  isObscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                signupButton(),
                const SizedBox(
                  height: 20,
                ),
                alternativeSign(),
              ],
            )),
      );
    }

    return Scaffold(
        backgroundColor: backgroundPrimaryColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              input_contents(),
            ],
          ),
        )));
  }
}
