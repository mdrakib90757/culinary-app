import 'package:culinary_app/core/utils/color.dart';
import 'package:culinary_app/feature/shopping_list/view/shopping_list_screen.dart';
import 'package:flutter/material.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({Key? key}) : super(key: key);

  @override
  State<MealPlannerScreen> createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  DateTime _selectedDay = DateTime.now();
  // Dummy data for days with meals
  final Set<int> _daysWithMeals = {10, 16, 23, 29};

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
                  "Meal Planner",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.star_border, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            top: headerHeight - 40,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: <Widget>[
                _buildMealCard(
                  'assets/images/edamame_stir_fry.png',
                  'Breakfast',
                  ['Mon', 'Tue', 'Wed', 'Diner'],
                  [
                    ['13', '8', '10', '12'],
                    ['2', '3', '8', '8'],
                  ],
                ),
                SizedBox(height: 10),
                _buildMealCard(
                  'assets/images/edamame_stir_fry.png',
                  'Lunch',
                  ['Thu', 'Wed', 'Fri', 'Drat'],
                  [
                    ['5', '6', '9', '6'],
                    ['14', '15', '16', '19'],
                  ],
                ),
                SizedBox(height: 10),
                _buildMealCard(
                  'assets/images/edamame_stir_fry.png',
                  'Dinner',
                  ['Sat', 'Sun', 'Fri', 'Short'],
                  [
                    ['11', '12', '10', '13'],
                    ['22', '29', '28', '29'],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealCard(
    String imageUrl,
    String title,
    List<String> columns,
    List<List<String>> data,
  ) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Meal Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 100,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15.0),
            // Meal Details / Table
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  _buildDataTable(columns, data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataTable(List<String> columns, List<List<String>> data) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dividerThickness: 0,
        columnSpacing: 20.0,
        dataRowHeight: 28.0,

        //border: TableBorder(top: BorderSide),
        headingRowHeight: 36.0,
        columns: columns
            .map(
              (name) => DataColumn(
                label: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            )
            .toList(),
        rows: data
            .map(
              (row) => DataRow(
                cells: row
                    .map(
                      (cell) =>
                          DataCell(Text(cell, style: TextStyle(fontSize: 15))),
                    )
                    .toList(),
              ),
            )
            .toList(),
      ),
    );
  }
}
