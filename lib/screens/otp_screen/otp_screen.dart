// lib/screens/otp_screen/otp_screen.dart
import 'package:amar_wallet/screens/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:amar_wallet/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../utils/media_query_utils.dart';
import '../../widgets/custom_primary_button.dart';
import '../../widgets/tapable_text.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              // Title Text
              const Text(
                AppStrings.otpTitle,
                style: TextStyle(
                  fontFamily: 'Sen',
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),

              const Text(
                "+8801****879",
                style: TextStyle(
                  fontFamily: 'Popins',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              // OTP Text Field
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.white,
                focusedBorderColor: Colors.white, // Active box color
                disabledBorderColor:
                    Colors.grey.withOpacity(0.5), // Inactive box color
                textStyle: const TextStyle(
                  color: Colors.white, // Input text color
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                fieldWidth: (MediaQueryUtils.screenWidth - 32 - 50) /
                    6, // Adjust width dynamically
                borderRadius: BorderRadius.circular(8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  // Handle individual field changes if needed
                },
                onSubmit: (String verificationCode) {
                  // Show dialog when OTP is submitted
                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return AlertDialog(
                  //       title: const Text("Verification Code"),
                  //       content: Text('Code entered is $verificationCode'),
                  //     );
                  //   },
                  // );
                },
              ),
              SizedBox(height: MediaQueryUtils.screenHeight * 0.07),
              // Continue Button
              CustomPrimaryButton(
                width: MediaQueryUtils.screenWidth - 32,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavScreen()),
                  );
                },
                text: AppStrings.continueButtonText,
              ),
              const Spacer(),
              // Tapable Text
              TapableText(
                firstPart: AppStrings.agreementText,
                secondPart: '',
                onTapFirst: () {
                  // Handle Terms and Conditions tap
                  launchUrl(Uri.parse('https://example.com/terms'));
                },
                onTapSecond: () {
                  // Handle Privacy Policy tap
                  launchUrl(Uri.parse('https://example.com/privacy'));
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
