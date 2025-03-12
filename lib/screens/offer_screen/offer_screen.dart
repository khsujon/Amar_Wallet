import 'package:amar_wallet/constants/app_colors.dart';
import 'package:amar_wallet/utils/media_query_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
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
                  const Text(
                    'Available Promos',
                    style: TextStyle(
                      fontFamily: 'Sen',
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryTextColor,
                    ),
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

              // Promo Cards

              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: MediaQueryUtils.screenHeight * 0.25,
                      width: MediaQueryUtils.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(45, 44, 44, 1),
                        border: Border.all(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Duncof',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset(
                                    "assets/images/mynaui_coffee.png"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '10% Discount on your coffee (up to BDT 100) minimum order of BDT 299',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(68, 68, 68, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'Add Promo',
                                  style: TextStyle(
                                    fontFamily: 'Sen',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Text(
                                'Valid till March 31, 2025',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
