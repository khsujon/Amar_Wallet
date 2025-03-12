import 'package:amar_wallet/screens/qr_code_screen/qr_code_screen.dart';
import 'package:amar_wallet/utils/media_query_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amar_wallet/constants/app_colors.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Color> cardColors = [
    Colors.red.shade500,
    Colors.green.shade700,
    Colors.blue.shade700,
    Colors.orange.shade500,
    Colors.purple.shade700,
    Colors.pink.shade700,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/zep.png",
                    height: 40,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(68, 68, 68, 1),
                      shape: BoxShape.circle,
                    ),
                    child:
                        const Icon(CupertinoIcons.search, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(68, 68, 68, 1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(CupertinoIcons.bell, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: MediaQueryUtils.screenHeight * 0.03),
              // Filter Buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(68, 68, 68, 1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child:
                              Image.asset("assets/images/Filter outline.png")),
                    ),
                    _buildFilterButton('All', true),
                    _buildFilterButton('Membership card', false),
                    _buildFilterButton('Coupons', false),
                    _buildFilterButton('Gift Cards', false),
                  ],
                ),
              ),
              SizedBox(height: MediaQueryUtils.screenHeight * 0.08),

              // Stacked Cards
              Expanded(
                child: Swiper(
                  itemCount: cardColors.length,
                  loop: true, // Disable infinite scrolling
                  scrollDirection: Axis.vertical, // Enables vertical swiping
                  physics:
                      const BouncingScrollPhysics(), // Adds smooth bounce effect
                  layout: SwiperLayout.STACK, // Stacked card layout
                  itemWidth: MediaQueryUtils.screenWidth * 0.9, // Adjust width
                  itemHeight:
                      MediaQueryUtils.screenHeight * 0.3, // Adjust height
                  itemBuilder: (context, index) {
                    return _buildGiftCard(cardColors[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QrCodeScreen()));
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        label: const Text(
          'Show Barcode',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Color.fromRGBO(68, 68, 68, 1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            label,
            style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          )),
    );
  }

  Widget _buildGiftCard(Color color) {
    return Container(
      height: MediaQueryUtils.screenHeight * 0.25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/starcafe.png'),
                  radius: 16,
                ),
                SizedBox(width: MediaQueryUtils.screenWidth * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Star Caffee',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Gift Card',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
