// lib/screens/login_screen/login_screen.dart
import 'package:amar_wallet/screens/otp_screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../utils/media_query_utils.dart';
import '../../widgets/custom_primary_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/tapable_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

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
                AppStrings.loginTitle,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              // Custom Text Field
              CustomTextField(
                hintText: '1XXX-XXX-XXXX',
                fixedText: '+880',
                controller: _phoneController,
              ),
              SizedBox(height: MediaQueryUtils.screenHeight * 0.07),
              // Continue Button
              CustomPrimaryButton(
                width:
                    MediaQueryUtils.screenWidth - 32, // Full width with padding
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OTPScreen()),
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
