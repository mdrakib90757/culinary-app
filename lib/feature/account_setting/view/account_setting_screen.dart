import 'package:culinary_app/core/utils/color.dart';
import 'package:flutter/material.dart';

class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // Define fixed heights or proportional heights for consistency
    final double headerHeight = screenHeight * 0.20;
    final double searchBarWidth = screenWidth * 0.9;
    final double searchBarVerticalOffset = 150.0;
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      // appBar: AppBar(
      //   backgroundColor: AppColors.primary,
      //   elevation: 0, // No shadow for the app bar
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      //   title: const Text(
      //     'Account Information',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          // Orange Header Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: headerHeight, // Use the defined header height
            child: Container(
              decoration: BoxDecoration(color: AppColors.primary),
            ),
          ),
          // Meal Planner Text and Basket Icon
          Positioned(
            top: 60,
            left: 15.0,
            right: 15.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Account Information",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: headerHeight - 40,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.white,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    // Edit Profile
                    _buildSettingItem(
                      icon: Icons.person_outline,
                      title: 'Edit Profile',
                      onTap: () {
                        print('Navigate to Edit Profile screen');
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
                      },
                    ),
                    const Divider(height: 0, indent: 16, endIndent: 16),

                    _buildSettingItem(
                      icon: Icons.edit_outlined,
                      title: 'Edit Profile',
                      onTap: () {
                        print(
                          'Navigate to a second Edit Profile screen or different action',
                        );
                      },
                    ),
                    const Divider(height: 0, indent: 16, endIndent: 16),
                    // Change Password
                    _buildSettingItem(
                      icon: Icons.lock_outline,
                      title: 'Change Password',
                      onTap: () {
                        print('Navigate to Change Password screen');
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
                      },
                    ),
                    const Divider(height: 0, indent: 16, endIndent: 16),
                    // My Privacy Settings (renamed from My Pucy Settings based on common app terminology)
                    _buildSettingItem(
                      icon: Icons.shield_outlined,
                      title: 'My Privacy Settings',
                      onTap: () {
                        print('Navigate to My Privacy Settings screen');
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacySettingsScreen()));
                      },
                    ),
                    const Divider(height: 0, indent: 16, endIndent: 16),
                    // Privacy (Privacy Policy or general Privacy info)
                    _buildSettingItem(
                      icon: Icons.info_outline,
                      title: 'Privacy',
                      onTap: () {
                        print('Navigate to Privacy Policy screen');
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));
                      },
                    ),
                    const Divider(height: 0, indent: 16, endIndent: 16),
                    // Contact Us
                    _buildSettingItem(
                      icon: Icons.contact_support_outlined,
                      title: 'Contact Us',
                      onTap: () {
                        print('Navigate to Contact Us screen');
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(icon, color: AppColors.iconActive, size: 24),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
