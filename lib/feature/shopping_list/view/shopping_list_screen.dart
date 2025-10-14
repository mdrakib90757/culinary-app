import 'package:culinary_app/core/utils/color.dart';
import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  // Sample data for the shopping list
  final List<Map<String, dynamic>> shoppingCategories = [
    {
      'title': 'Sroodour plet',
      'image': 'assets/images/lemon_herb_chicken.png',
      'items': [
        {'name': 'Carnolc', 'checked': true},
        {'name': 'Qnites', 'checked': false},
        {'name': 'Temeto Tuote', 'checked': false},
      ],
    },
    {
      'title': 'Dairy',
      'image': 'assets/images/hearty_lentil_soup.png',
      'items': [
        {'name': 'Onions', 'checked': true},
        {'name': 'Slotio', 'checked': false},
      ],
    },
    {
      'title': 'Dairy',
      'image': 'assets/images/spicy_peanut_noodles.png',
      'items': [
        {'name': 'Garlic', 'checked': true},
        {'name': 'Gorites', 'checked': false},
      ],
    },
    {
      'title': 'Pantry',
      'image': 'assets/images/edamame_stir_fry.png',
      'items': [
        {'name': 'Slinters', 'checked': true},
        {'name': 'Temate Paste', 'checked': false},
      ],
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
                  "Shopping List",
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
            child: ListView.builder(
              itemCount: shoppingCategories.length,
              itemBuilder: (context, index) {
                return _buildShoppingCategoryCard(
                  shoppingCategories[index]['image'],
                  shoppingCategories[index]['title'],
                  shoppingCategories[index]['items'],
                );
              },
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShoppingCategoryCard(
    String imageUrl,
    String categoryTitle,
    List<Map<String, dynamic>> items,
  ) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Category Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            // Category Title and Items
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    categoryTitle,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  ...items
                      .map(
                        (item) =>
                            _buildShoppingItem(item['name'], item['checked']),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShoppingItem(String itemName, bool isChecked) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              itemName,
              style: TextStyle(
                fontSize: 16,
                decoration: isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: isChecked ? Colors.grey : Colors.black,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          // Custom Checkbox or Icon
          Icon(
            isChecked ? Icons.check_circle : Icons.circle_outlined,
            color: isChecked ? AppColors.greenColor : Colors.grey[400],
            size: 24,
          ),
        ],
      ),
    );
  }
}
