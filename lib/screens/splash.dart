import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelme/providers/auth_provider.dart';
import 'package:travelme/services/auth_services.dart';
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
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    AuthServices authServices = AuthServices();
    AuthProvider authProvider = Provider.of(context, listen: false);
    try {
      String? token = await authServices.getToken();

      await Future.delayed(const Duration(milliseconds: 3000));

      if (token != null) {
        await authProvider.getUserDataFromStorage();
        Navigator.pushNamedAndRemoveUntil(context, '/main', (_) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/landing', (_) => false);
      }
    } catch (e) {
      // Handle error appropriately, e.g., show a dialog or log the error
      print("Error checking login status: $e");
      Navigator.pushNamedAndRemoveUntil(context, '/landing', (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
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
