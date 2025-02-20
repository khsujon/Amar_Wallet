// lib/screens/splash_screen/splash_screen.dart
import 'package:amar_wallet/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../utils/media_query_utils.dart';
import '../../widgets/custom_primary_button.dart'; // Import the custom button

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize MediaQuery dimensions here instead of initState()
    MediaQueryUtils.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQueryUtils.screenHeight * 0.15),
            // Hero Image
            Image.asset(
              'assets/images/hero_image.png',
              width: MediaQueryUtils.screenWidth * 0.6,
              height: MediaQueryUtils.screenHeight * 0.3,
            ),
            const SizedBox(height: 24),
            // "Get Started" Text
            const Text(
              AppStrings.getStartedTitle,
              style: TextStyle(
                fontFamily: 'Sen',
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryTextColor,
              ),
            ),
            const SizedBox(height: 8),
            // Subtitle Text
            const Text(
              AppStrings.getStartedSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryTextColor,
              ),
            ),
            SizedBox(height: MediaQueryUtils.screenHeight * 0.15),
            // Custom Primary Button
            CustomPrimaryButton(
              width: MediaQueryUtils.screenWidth * 0.6,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              text: AppStrings.getStartedButtonText,
            ),
          ],
        ),
      ),
    );
  }
}
