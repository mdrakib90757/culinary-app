import 'package:culinary_app/core/utils/color.dart';
import 'package:culinary_app/feature/recipe_details/recipe_details_widget/todo_list_card.dart';
import 'package:flutter/material.dart';

import '../recipe_details_widget/custom_info_card.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final String title;
  final String imageUrl;

  const RecipeDetailsScreen({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

// ... আপনার ফাইলের উপরের সব import অপরিবর্তিত থাকবে ...

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // ... আপনার বাকি স্টেট ভ্যারিয়েবল ...

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4, // আপনার ট্যাবের সংখ্যা
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Background Image
              Container(
                height: 380,
                width: double.infinity,
                child: Image.asset(widget.imageUrl, fit: BoxFit.cover),
              ),

              // Details Card
              Positioned(
                top: 330,
                left: 15.0,
                right: 15.0,
                child: Card(
                  elevation: 5,
                  color: AppColors.cardBackground,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TabBar(
                          // onTap: (index) {
                          //   setState(() {
                          //     _tabController.index = index;
                          //   });
                          // },
                          controller: _tabController,
                          isScrollable: true,
                          padding: EdgeInsets.zero,
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          tabAlignment: TabAlignment.start,
                          dividerColor: Colors.transparent,
                          labelColor: AppColors.greenColor,
                          unselectedLabelColor: AppColors.iconInactive,
                          indicatorColor: AppColors.greenColor,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: const [
                            Tab(text: 'More'),
                            Tab(text: 'Favorites'),
                            Tab(text: 'Share'),
                            Tab(text: 'Add to mealplan'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 80),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // custom todo list card
                        TodoListCard(),

                        // custom info card
                        CustomInfoCard(
                          imageUrl: 'assets/images/edamame_stir_fry.png',
                          title: 'Coveroomts',
                          subtitle: 'Ctoons in 13 10:00',
                          onTap: () {
                            print("Coveroomts card tapped!");
                          },
                        ),

                        // custom info card
                        CustomInfoCard(
                          imageUrl: 'assets/images/edamame_stir_fry.png',
                          title: 'Another Item',
                          subtitle: 'Details for another item',
                          onTap: () {
                            print("Another card tapped!");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // color: Colors.white,
                  child: const Center(child: Text("Favorites Tab Content")),
                ),
                Container(
                  // color: Colors.white,
                  child: const Center(child: Text("Share Tab Content")),
                ),
                Container(
                  // color: Colors.white,
                  child: const Center(
                    child: Text("Add to mealplan Tab Content"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
