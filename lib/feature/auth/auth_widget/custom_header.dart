import 'package:culinary_app/core/utils/color.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomHeader({
    super.key,
    required this.title,
    this.showBackButton = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(120.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (showBackButton)
                IconButton(
                  icon:  Icon(Icons.arrow_back, color: AppColors.background),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              const Spacer(),
              // You can add more icons here if needed, like the shopping cart icon
              const Icon(Icons.shopping_bag_outlined, color: Colors.white),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: showBackButton ? 0 : 5, top: 10.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}