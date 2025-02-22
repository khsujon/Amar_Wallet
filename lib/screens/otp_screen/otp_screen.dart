// lib/screens/otp_screen/otp_screen.dart
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart'; // Import the sms_autofill package
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../utils/media_query_utils.dart';
import '../../widgets/custom_primary_button.dart';
import '../../widgets/tapable_text.dart';
import '../../screens/bottom_nav_screen/bottom_nav_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late TextEditingController _otpController;
  String? _appSignature;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
    _listenForAppSignature(); // Get the app signature for SMS autofill
  }

  // Listen for the app signature (required for SMS autofill)
  Future<void> _listenForAppSignature() async {
    String? signature = await SmsAutoFill().getAppSignature;
    setState(() {
      _appSignature = signature; // Store the app signature
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
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
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              // PinFieldAutoFill (Box Shape)
              PinFieldAutoFill(
                controller: _otpController,
                decoration: BoxLooseDecoration(
                  textStyle: const TextStyle(
                    color: Colors.white, // Input text color
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  strokeColorBuilder:
                      FixedColorBuilder(Colors.white), // Border color
                  strokeWidth: 2,
                  bgColorBuilder:
                      FixedColorBuilder(Colors.transparent), // Background color
                  radius: const Radius.circular(8), // Rounded corners
                ),
                codeLength: 6, // Number of OTP fields
                onCodeChanged: (code) {
                  // if (code?.length == 6) {
                  //   // Automatically submit OTP when 6 digits are entered
                  //   print('OTP submitted: $code');
                  //   FocusScope.of(context).unfocus();
                  // }
                },
                onCodeSubmitted: (code) {
                  // Handle OTP submission
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
                },
                onTapSecond: () {
                  // Handle Privacy Policy tap
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
