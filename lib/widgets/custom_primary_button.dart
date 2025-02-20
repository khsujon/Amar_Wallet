import 'package:amar_wallet/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  final double width;
  final VoidCallback onTap;
  final String text;

  const CustomPrimaryButton({
    Key? key,
    required this.width,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.buttonColor, // Button background color
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.buttonTextColor,
          ),
        ),
      ),
    );
  }
}
