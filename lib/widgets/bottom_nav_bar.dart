// lib/widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bottom_nav_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return BottomNavigationBar(
      currentIndex: bottomNavProvider.currentIndex,
      onTap: (index) {
        bottomNavProvider.setCurrentIndex(index); // Update the selected index
      },
      selectedItemColor: Colors.white, // Active icon color
      unselectedItemColor: Colors.grey, // Inactive icon color
      backgroundColor: Colors.black, // Background color of the nav bar
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '',
        ),
      ],
    );
  }
}
