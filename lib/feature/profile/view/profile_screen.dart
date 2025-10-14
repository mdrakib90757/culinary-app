import 'package:culinary_app/core/utils/color.dart';
import 'package:culinary_app/feature/account_setting/view/account_setting_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkModeEnabled = false;

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
      body: Stack(
        children: [
          // Orange Header Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: headerHeight,
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
                  "Profile",
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // User Header Section
                  _buildUserHeader(),
                  const SizedBox(height: 20),

                  // "Your Content" Section
                  _buildContentSection(),
                  const SizedBox(height: 20),

                  // Log Out Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle log out
                        print('User logged out');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        'Log Out',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, size: 60, color: Colors.white),
          // You can use backgroundImage: NetworkImage('your_profile_image_url')
        ),
        const SizedBox(height: 10),
        const Text(
          'Jane Doe',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Dolor sit amet, consectetur',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildContentSection() {
    return Card(
      color: AppColors.cardBackground,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Text(
                'Your Content',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            _buildProfileListItem(
              icon: Icons.favorite_border,
              title: 'Favorite Recipes',
              onTap: () {
                print('Navigate to Favorite Recipes');
                // Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteRecipesScreen()));
              },
            ),
            _buildProfileListItem(
              icon: Icons.calendar_today_outlined,
              title: 'My Meal Plans',
              trailingWidget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '8-10',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              onTap: () {
                print('Navigate to My Meal Plans');
                // Navigator.push(context, MaterialPageRoute(builder: (context) => MyMealPlansScreen()));
              },
            ),
            _buildProfileListItem(
              icon: Icons.nights_stay,
              title: 'Dark Mode',
              trailingWidget: Switch(
                value: _isDarkModeEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _isDarkModeEnabled = value;
                  });
                  print('Dark Mode: $_isDarkModeEnabled');
                },
                activeColor: AppColors.greenColor,
              ),
            ),
            _buildProfileListItem(
              icon: Icons.language,
              title: 'Language',
              onTap: () {
                print('Open Language Selector');
                // Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageSelectorScreen()));
              },
            ),
            _buildProfileListItem(
              icon: Icons.settings,
              title: 'Account Settings',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountInformationScreen(),
                  ),
                );
                print('Open Account Settings');

                // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInfoScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileListItem({
    required IconData icon,
    required String title,
    Widget? trailingWidget,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing:
          trailingWidget ??
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
    );
  }
}
