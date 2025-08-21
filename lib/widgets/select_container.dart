import 'package:flutter/material.dart';

class SelectContainerModel {
  final String title;
  final String duration;
  final VoidCallback onTap;

  const SelectContainerModel({
    required this.title,
    required this.duration,
    required this.onTap,
  });
}

class SelectContainer extends StatelessWidget {
  final SelectContainerModel model;

  const SelectContainer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: model.onTap,
      child: Container(
        height: 90,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black54 : Colors.grey.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              model.duration,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                color: isDark ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}