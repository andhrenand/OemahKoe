import 'package:flutter/material.dart';
import 'package:oemah_koe/app/shared/themes/app_theme.dart';

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String titleCategory;
  final VoidCallback? onPressed;

  const CategoryButton({
    super.key,
    required this.icon,
    required this.titleCategory,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 70,
        width: 90,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border.all(color: AppTheme.divider),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: AppTheme.shadow,
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 2),
            Icon(icon, color: AppTheme.gold),
            const SizedBox(height: 6),
            Text(
              titleCategory,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppTheme.primaryText,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
