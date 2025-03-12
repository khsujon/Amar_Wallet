import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bottom_nav_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    final List<Map<String, dynamic>> _navItems = [
      {"icon": CupertinoIcons.tag, "label": "Offers"},
      {"icon": CupertinoIcons.house_fill, "label": "Home"},
      {"icon": CupertinoIcons.time, "label": "History"},
    ];

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ), // Adjust position
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Container
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(45, 44, 44, 1),
              borderRadius: BorderRadius.circular(30),
            ),
          ),

          // Row for Navigation Items
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_navItems.length, (index) {
                bool isSelected = bottomNavProvider.currentIndex == index;
                return GestureDetector(
                  onTap: () {
                    bottomNavProvider.setCurrentIndex(index);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(
                        vertical: 8, horizontal: isSelected ? 20 : 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color.fromRGBO(68, 68, 68, 1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _navItems[index]["icon"],
                          color: isSelected ? Colors.white : Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            _navItems[index]["label"],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
