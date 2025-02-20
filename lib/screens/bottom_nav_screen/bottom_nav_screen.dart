// lib/screens/bottom_nav_screen/bottom_nav_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/bottom_nav_provider.dart';
import '../home_screen/home_screen.dart';
import '../menu_screen/menu_screen.dart';
import '../settings_screen/settings_screen.dart';
import '../../widgets/bottom_nav_bar.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavProvider>(
        builder: (context, bottomNavProvider, child) {
          // Switch between screens based on the selected index
          switch (bottomNavProvider.currentIndex) {
            case 0:
              return const HomeScreen();
            case 1:
              return const MenuScreen();
            case 2:
              return const SettingsScreen();
            default:
              return const HomeScreen();
          }
        },
      ),
      bottomNavigationBar:
          const BottomNavBar(), // Add the bottom navigation bar
    );
  }
}
