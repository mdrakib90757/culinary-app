import 'package:culinary_app/core/shared_widgets/recipe_card_widget.dart';
import 'package:culinary_app/core/utils/color.dart';
import 'package:culinary_app/feature/recipe_details/view/recipe_details_screen.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<Map<String, dynamic>> _recipes = [
    {
      'title': 'Spicy Peanut Noodles',
      'rating': 4,
      'imageUrl': 'assets/images/spicy_peanut_noodles.png',
    },
    {
      'title': 'Lemon Herb Roasted Chicken',
      'rating': 5,
      'imageUrl': 'assets/images/lemon_herb_chicken.png',
    },
    {
      'title': 'Edamame Stir Fry',
      'rating': 3,
      'imageUrl': 'assets/images/edamame_stir_fry.png',
    },
    {
      'title': 'Hearty Lentil Soup',
      'rating': 4,
      'imageUrl': 'assets/images/hearty_lentil_soup.png',
    },
    {
      'title': 'Hearty Lentil Soup',
      'rating': 4,
      'imageUrl': 'assets/images/hearty_lentil_soup.png',
    },
    {
      'title': 'Hearty Lentil Soup',
      'rating': 4,
      'imageUrl': 'assets/images/hearty_lentil_soup.png',
    },
  ];

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
          // Discover Text and Basket Icon
          Positioned(
            top: 60,
            left: 15.0,
            right: 15.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discover",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_basket_outlined,
                    color: AppColors.textLight,
                  ),
                  onPressed: () {
                    // Handle basket tap
                  },
                ),
              ],
            ),
          ),
          // Search Box - positioned absolutely for precise control
          Positioned(
            top: searchBarVerticalOffset,
            left: (screenWidth - searchBarWidth) / 2,
            width: searchBarWidth,
            child: TextField(
              cursorColor: AppColors.primary,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.qr_code_scanner, color: AppColors.primary),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ),

          // filter row
          Padding(
            padding: EdgeInsets.only(
              top: searchBarVerticalOffset + 60,
              left: 15.0,
              right: 15.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filters',
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(fontSize: 18),
                        ),
                        Row(
                          children: [
                            _buildFilterDot(Colors.red),
                            _buildFilterDot(Colors.orange),
                            _buildFilterDot(Colors.green),
                            Icon(Icons.star, color: Colors.grey[400]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Grid of recipe cards
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 0.75,
                        ),
                    itemCount: _recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = _recipes[index];
                      return RecipeCard(
                        title: recipe['title'],
                        rating: recipe['rating'],
                        imageUrl: recipe['imageUrl'],
                        onTap: () {
                          // Navigate to recipe details screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeDetailsScreen(
                                title: recipe['title'],
                                imageUrl: recipe['imageUrl'],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // filter dot widget
  Widget _buildFilterDot(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
