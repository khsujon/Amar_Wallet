import 'package:amar_wallet/constants/app_colors.dart';
import 'package:amar_wallet/utils/media_query_utils.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Back Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQueryUtils.screenHeight * 0.05),
            // QR Code Icon
            Image.asset("assets/images/ci_qr-code.png"),
            SizedBox(height: MediaQueryUtils.screenHeight * 0.01),
            // Title
            const Text(
              'Scan QR Code',
              style: TextStyle(
                  fontFamily: 'Sen',
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryTextColor),
            ),
            SizedBox(height: MediaQueryUtils.screenHeight * 0.13),
            // Profile Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                      'assets/images/demo_profile.png'), // Change as needed
                ),
                const SizedBox(width: 8),
                const Text(
                  'Mash Potato',
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Barcode
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  BarcodeWidget(
                    data: '931166145931635220',
                    barcode: Barcode.code128(),
                    width: MediaQueryUtils.screenWidth * 0.6,
                    height: MediaQueryUtils.screenHeight * 0.12,
                    drawText: false,
                    color: Colors.black,
                  ),
                  SizedBox(height: MediaQueryUtils.screenHeight * 0.015),
                  // Barcode number
                  const Text(
                    '931166145931635220',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Download QR Button
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        label: const Text(
          'Download QR',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
