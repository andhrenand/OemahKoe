import 'package:flutter/material.dart';
import 'package:oemah_koe/app/shared/themes/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double height;
  final double borderRadius;
  final double fontSize;

  const PrimaryButton({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.height = 56,
    this.borderRadius = 16,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBackground = backgroundColor ?? AppTheme.gold;
    final effectiveForeground = foregroundColor ?? AppTheme.onPrimary;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBackground,
          foregroundColor: effectiveForeground,
          disabledBackgroundColor: effectiveBackground.withValues(alpha: 0.55),
          disabledForegroundColor: effectiveForeground.withValues(alpha: 0.70),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              title,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
