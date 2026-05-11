import 'package:flutter/material.dart';
import 'package:oemah_koe/app/shared/themes/app_theme.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppTheme.surface,
              hintText: "What are you looking for?",
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: AppTheme.faintText,
              ),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: AppTheme.mutedText,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppTheme.divider),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppTheme.gold),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.divider),
              color: AppTheme.gold,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.tune_rounded, color: AppTheme.onPrimary),
          ),
        ),
      ],
    );
  }
}
