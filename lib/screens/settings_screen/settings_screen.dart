import 'package:amar_wallet/utils/media_query_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amar_wallet/constants/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Account & Settings',
            style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'Sen')),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage:
                        AssetImage('assets/images/demo_profile.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mash Potato',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryTextColor),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '+0881****879',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryTextColor),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQueryUtils.screenHeight * 0.05),

              _buildSectionTitle('Account'),
              _SettingsItem(icon: Icons.person, text: 'Profile'),
              _SettingsItem(icon: Icons.business, text: 'Business Profile'),
              _SettingsItem(icon: Icons.payment, text: 'Digital Payment'),
              _SettingsItem(icon: Icons.location_on, text: 'Saved Address'),
              SizedBox(height: MediaQueryUtils.screenHeight * 0.03),

              _buildSectionTitle('Offers'),
              _SettingsItem(icon: Icons.local_offer, text: 'Promos'),
              _SettingsItem(
                  icon: Icons.card_giftcard, text: 'Refer & Get Discounts'),
              SizedBox(height: MediaQueryUtils.screenHeight * 0.03),

              _buildSectionTitle('Settings'),
              _SettingsItem(icon: Icons.language, text: 'Language'),
              _SettingsItem(icon: Icons.security, text: 'Permissions'),
              SizedBox(height: MediaQueryUtils.screenHeight * 0.03),

              _buildSectionTitle('Help & Legal'),
              _SettingsItem(icon: Icons.support, text: 'Emergency Support'),
              _SettingsItem(icon: Icons.help, text: 'Help'),
              _SettingsItem(icon: Icons.report, text: 'Support Requests'),
              _SettingsItem(icon: Icons.policy, text: 'Policies'),
              SizedBox(height: MediaQueryUtils.screenHeight * 0.03),

              _buildSectionTitle('Log Out'),
              _SettingsItem(
                  icon: Icons.logout, text: 'Log out', isLogout: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Sen',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryTextColor),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isLogout;

  const _SettingsItem(
      {required this.icon, required this.text, this.isLogout = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
                backgroundColor: Color.fromRGBO(68, 68, 68, 1),
                child: Icon(icon, color: isLogout ? Colors.red : Colors.white)),
            SizedBox(
              width: MediaQueryUtils.screenWidth * 0.02,
            ),
            Text(text,
                style: TextStyle(
                    color: isLogout ? Colors.red : Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ],
        ));
  }
}
