import 'package:amar_wallet/constants/app_colors.dart';
import 'package:amar_wallet/utils/media_query_utils.dart';
import 'package:amar_wallet/widgets/offer_card.dart';
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
                    OfferCard(),
                    SizedBox(
                      height: MediaQueryUtils.screenHeight * 0.02,
                    ),
                    OfferCard(),
                    SizedBox(
                      height: MediaQueryUtils.screenHeight * 0.02,
                    ),
                    OfferCard(),
                    SizedBox(
                      height: MediaQueryUtils.screenHeight * 0.02,
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
