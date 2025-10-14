import 'package:flutter/material.dart';
import 'package:culinary_app/core/utils/color.dart';

class TodoListCard extends StatelessWidget {
  const TodoListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TodoItem(text: 'Feel lonely'),
            Divider(height: 24),
            TodoItem(text: 'Lemooth yroot ctisitg'),
            Divider(height: 24),
            TodoItem(text: 'Topsie stwoon text doctoers'),
          ],
        ),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final String text;
  const TodoItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 16),

        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 16),

        Icon(Icons.more_horiz, color: Colors.grey.shade400),
      ],
    );
  }
}
