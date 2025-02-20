// lib/widgets/tapable_text.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TapableText extends StatelessWidget {
  final String firstPart;
  final String secondPart;
  final VoidCallback onTapFirst;
  final VoidCallback onTapSecond;

  const TapableText({
    Key? key,
    required this.firstPart,
    required this.secondPart,
    required this.onTapFirst,
    required this.onTapSecond,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: firstPart,
          style: const TextStyle(
            fontFamily: 'Poppins',
            letterSpacing: 0.5,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          children: [
            TextSpan(
              text: 'Terms\nand Conditions',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTapFirst,
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTapSecond,
            ),
          ],
        ),
      ),
    );
  }
}
