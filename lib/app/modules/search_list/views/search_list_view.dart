import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oemah_koe/app/data/dummy_data.dart';
import 'package:oemah_koe/app/modules/home/widget/property_card.dart';
import 'package:oemah_koe/app/routes/app_pages.dart';
import 'package:oemah_koe/app/shared/helper/rupiah_converter.dart';
import 'package:oemah_koe/app/shared/themes/app_theme.dart';
import 'package:oemah_koe/app/shared/widgets/search_container.dart';

import '../controllers/search_list_controller.dart';

class SearchListView extends GetView<SearchListController> {
  const SearchListView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find Property',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${dummyProperties.length} premium spaces available',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppTheme.mutedText,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.near_me, color: AppTheme.mutedText),
                          SizedBox(width: 10),
                          Text("${dummyUser['location']}, Indonesia"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SearchContainer(),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _FilterChip(label: 'All'),
                _FilterChip(label: 'House'),
                _FilterChip(label: 'Apartment'),
                _FilterChip(label: 'Kost'),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Recommend For you",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 280,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = dummyProperties[index];
                  return Align(
                    child: PropertyCard(
                      property: item,
                      title: item['title'],
                      location: item['location'],
                      image: item['image'],
                      price: item['price'],
                      bedroom: item['bedroom'],
                      bathroom: item['bathroom'],
                      size: item['size'] as int?,
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_PROPERTY, arguments: item);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: dummyProperties.length > 3
                    ? 3
                    : dummyProperties.length,
              ),
            ),
            const SizedBox(height: 24),
            ...dummyProperties.map(
              (property) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _PropertyListCard(property: property),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;

  const _FilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final isActive = label == 'All';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.gold : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: isActive ? AppTheme.gold : AppTheme.divider),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppTheme.onPrimary : AppTheme.primaryText,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _PropertyListCard extends StatelessWidget {
  final Map<String, dynamic> property;

  const _PropertyListCard({required this.property});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(24),
      shadowColor: AppTheme.shadow,
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () => Get.toNamed(Routes.DETAIL_PROPERTY, arguments: property),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  property['image'] as String,
                  width: 112,
                  height: 112,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.gold.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        property['category'] as String,
                        style: const TextStyle(
                          color: AppTheme.gold,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      property['title'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      property['location'] as String,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppTheme.mutedText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${formatRupiah(property['price'] as int)}/month',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppTheme.gold,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.bed_outlined, size: 16),
                        const SizedBox(width: 4),
                        Text('${property['bedroom']}'),
                        const SizedBox(width: 12),
                        const Icon(Icons.bathtub_outlined, size: 16),
                        const SizedBox(width: 4),
                        Text('${property['bathroom']}'),
                        const SizedBox(width: 12),
                        const Icon(Icons.square_foot_rounded, size: 16),
                        const SizedBox(width: 4),
                        Text('${property['size']} m2'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
