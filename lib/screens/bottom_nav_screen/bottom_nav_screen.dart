import 'package:amar_wallet/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/bottom_nav_provider.dart';
import '../home_screen/home_screen.dart';
import '../offer_screen/offer_screen.dart';
import '../settings_screen/settings_screen.dart';
import '../../widgets/bottom_nav_bar.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavProvider>(
        builder: (context, bottomNavProvider, child) {
          switch (bottomNavProvider.currentIndex) {
            case 0:
              return const OfferScreen();
            case 1:
              return const HomeScreen();
            case 2:
              return const SettingsScreen();
            default:
              return const HomeScreen();
          }
        },
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor,
            ),
          ],
        ),
        child: const BottomNavBar(),
      ),
    );
  }
}
