import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oemah_koe/app/modules/bookmark/controllers/bookmark_controller.dart';
import 'package:oemah_koe/app/shared/helper/rupiah_converter.dart';
import 'package:oemah_koe/app/shared/themes/app_theme.dart';

import '../controllers/detail_property_controller.dart';

class DetailPropertyView extends GetView<DetailPropertyController> {
  DetailPropertyView({super.key});

  final Map<String, dynamic> data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bookmarkController = Get.find<BookmarkController>();
    final gallery = List<String>.from(data['gallery'] ?? [data['image']]);
    final facilities = List<String>.from(data['facilities'] ?? const []);
    final agent = Map<String, dynamic>.from(data['agent'] ?? const {});
    final rating = ((data['rating'] ?? 4.7) as num).toDouble();
    final reviews = data['reviews'] ?? 0;
    final priceUnit = data['priceUnit'] ?? 'month';

    return Scaffold(
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppTheme.divider),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.24),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatRupiah(data['price'] as int),
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'per $priceUnit',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppTheme.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.gold,
                    foregroundColor: AppTheme.onPrimary,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Book Visit',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 420,
                  width: double.infinity,
                  child: Image.asset(data['image'], fit: BoxFit.cover),
                ),
                Container(
                  height: 420,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.14),
                        Colors.black.withValues(alpha: 0.72),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 56,
                  child: _CircleActionButton(
                    icon: Icons.arrow_back_rounded,
                    onTap: Get.back,
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 56,
                  child: Obx(
                    () => _CircleActionButton(
                      icon: bookmarkController.isBookmarked(data)
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,
                      iconColor: bookmarkController.isBookmarked(data)
                          ? AppTheme.gold
                          : Colors.white,
                      onTap: () => bookmarkController.toggleBookmark(data),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 28,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.gold,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          data['category'],
                          style: const TextStyle(
                            color: AppTheme.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        data['title'],
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.place_rounded,
                            size: 18,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              data['address'] ?? data['location'],
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, -18),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppTheme.divider),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _InfoMetric(
                          label: 'Rating',
                          value: rating.toStringAsFixed(1),
                          icon: Icons.star_rounded,
                        ),
                      ),
                      Expanded(
                        child: _InfoMetric(
                          label: 'Reviews',
                          value: '$reviews',
                          icon: Icons.mode_comment_outlined,
                        ),
                      ),
                      Expanded(
                        child: _InfoMetric(
                          label: 'Distance',
                          value: data['distance'] ?? '-',
                          icon: Icons.near_me_rounded,
                          compact: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formatRupiah(data['price'] as int),
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Premium rental fee per $priceUnit',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppTheme.mutedText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppTheme.divider),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 18,
                              color: AppTheme.gold,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${rating.toStringAsFixed(1)} ($reviews)',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 130,
                    child: Row(
                      children: [
                        Expanded(
                          child: _SpecCard(
                            icon: Icons.king_bed_rounded,
                            label: 'Bedroom',
                            value: '${data['bedroom']}',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _SpecCard(
                            icon: Icons.bathtub_rounded,
                            label: 'Bathroom',
                            value: '${data['bathroom']}',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _SpecCard(
                            icon: Icons.square_foot_rounded,
                            label: 'Area',
                            value: '${data['size']} m2',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  const _SectionTitle(
                    title: 'About Property',
                    actionLabel: 'Verified Listing',
                  ),
                  const SizedBox(height: 12),
                  Text(
                    data['description'],
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppTheme.mutedText,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 28),
                  const _SectionTitle(title: 'Top Facilities'),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: facilities
                        .map((facility) => _FacilityChip(label: facility))
                        .toList(),
                  ),
                  const SizedBox(height: 28),
                  const _SectionTitle(title: 'Gallery'),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 116,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: gallery.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final image = gallery[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              Image.asset(
                                image,
                                width: 160,
                                height: 116,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: 160,
                                height: 116,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withValues(alpha: 0.35),
                                    ],
                                  ),
                                ),
                              ),
                              if (index == 0)
                                Positioned(
                                  left: 10,
                                  bottom: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.45,
                                      ),
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: const Text(
                                      'Main view',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  const _SectionTitle(title: 'Location Insight'),
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: AppTheme.divider),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: AppTheme.gold.withValues(alpha: 0.14),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.location_city_rounded,
                                color: AppTheme.gold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['location'],
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    data['distance'] ?? '',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppTheme.mutedText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          data['address'] ?? '',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppTheme.mutedText,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  const _SectionTitle(title: 'Contact Agent'),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppTheme.divider),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            agent['image'] ?? 'assets/images/profilePict.png',
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                agent['name'] ?? 'Property Consultant',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                agent['role'] ?? 'Rental Advisor',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: AppTheme.mutedText,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                agent['responseTime'] ?? '',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: AppTheme.gold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: AppTheme.gold,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.chat_bubble_rounded,
                            color: AppTheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleActionButton extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  const _CircleActionButton({required this.icon, this.iconColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withValues(alpha: 0.42),
            border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
          ),
          child: Icon(icon, color: iconColor ?? Colors.white),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String? actionLabel;

  const _SectionTitle({required this.title, this.actionLabel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        if (actionLabel != null)
          Text(
            actionLabel!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppTheme.gold,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }
}

class _InfoMetric extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool compact;

  const _InfoMetric({
    required this.icon,
    required this.label,
    required this.value,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppTheme.gold, size: 20),
        const SizedBox(height: 8),
        Text(
          value,
          maxLines: compact ? 2 : 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(color: AppTheme.mutedText),
        ),
      ],
    );
  }
}

class _SpecCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _SpecCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 190,
      width: 190,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 34,
            decoration: BoxDecoration(
              color: AppTheme.gold.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 18, color: AppTheme.gold),
          ),
          const Spacer(),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppTheme.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}

class _FacilityChip extends StatelessWidget {
  final String label;

  const _FacilityChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
              color: AppTheme.gold,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
