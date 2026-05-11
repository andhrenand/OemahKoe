import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oemah_koe/app/data/dummy_data.dart';
import 'package:oemah_koe/app/routes/app_pages.dart';
import 'package:oemah_koe/app/shared/themes/app_theme.dart';
import 'package:oemah_koe/app/shared/widgets/primary_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final name = dummyUser['name'] as String? ?? 'Guest User';
    final location = dummyUser['location'] as String? ?? '-';
    final image = dummyUser['profilePict'] as String? ?? '';

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.background,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppTheme.primaryText),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppTheme.primaryText,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 36,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      ProfileHeader(
                        imagePath: image,
                        name: name,
                        subtitle: 'andhika.renan@email.com',
                      ),
                      const SizedBox(height: 28),
                      InfoCard(
                        items: [
                          InfoItem(label: 'Full Name', value: name),
                          const InfoItem(
                            label: 'Phone Number',
                            value: '+62 812 3456 7890',
                          ),
                          InfoItem(
                            label: 'Address',
                            value: '$location, Indonesia',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _MenuCard(
                        children: [
                          MenuItemTile(
                            icon: Icons.edit_outlined,
                            title: 'Edit Profile',
                            isActive: true,
                            onTap: () {},
                          ),
                          MenuItemTile(
                            icon: Icons.receipt_long_outlined,
                            title: 'My Orders',
                            onTap: () {},
                          ),
                          MenuItemTile(
                            icon: Icons.credit_card_outlined,
                            title: 'Payment Methods',
                            onTap: () {},
                          ),
                          MenuItemTile(
                            icon: Icons.settings_outlined,
                            title: 'Settings',
                            onTap: () {},
                            showDivider: false,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        title: 'Logout',
                        icon: Icons.logout_rounded,
                        backgroundColor: AppTheme.danger,
                        foregroundColor: AppTheme.onPrimary,
                        borderRadius: 18,
                        onPressed: () {Get.offNamed(Routes.SIGN_IN);},
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String imagePath;
  final String name;
  final String subtitle;

  const ProfileHeader({
    super.key,
    required this.imagePath,
    required this.name,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppTheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.shadow,
                    blurRadius: 24,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppTheme.softSurface,
                backgroundImage: imagePath.isEmpty
                    ? null
                    : AssetImage(imagePath),
                child: imagePath.isEmpty
                    ? const Icon(
                        Icons.person_rounded,
                        size: 42,
                        color: AppTheme.mutedText,
                      )
                    : null,
              ),
            ),
            Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.surface, width: 3),
              ),
              child: const Icon(
                Icons.edit_rounded,
                color: AppTheme.onPrimary,
                size: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppTheme.primaryText,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppTheme.mutedText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final List<InfoItem> items;

  const InfoCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return _ProfileCard(
      child: Column(
        children: [
          for (var index = 0; index < items.length; index++) ...[
            _InfoRow(item: items[index]),
            if (index != items.length - 1)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Divider(height: 1, color: AppTheme.divider),
              ),
          ],
        ],
      ),
    );
  }
}

class InfoItem {
  final String label;
  final String value;

  const InfoItem({required this.label, required this.value});
}

class _InfoRow extends StatelessWidget {
  final InfoItem item;

  const _InfoRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            item.label,
            style: const TextStyle(
              color: AppTheme.mutedText,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 5,
          child: Text(
            item.value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: AppTheme.primaryText,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }
}

class MenuItemTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final bool showDivider;
  final bool isActive;

  const MenuItemTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.showDivider = true,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconBackground = isActive
        ? AppTheme.primary.withValues(alpha: 0.12)
        : AppTheme.softSurface;
    final iconColor = isActive ? AppTheme.primary : AppTheme.primaryText;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: iconBackground,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(icon, color: iconColor, size: 21),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: AppTheme.primaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppTheme.mutedText,
                  ),
                ],
              ),
            ),
            if (showDivider)
              const Divider(height: 1, indent: 56, color: AppTheme.divider),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final List<Widget> children;

  const _MenuCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return _ProfileCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Column(children: children),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const _ProfileCard({
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: AppTheme.shadow,
            blurRadius: 24,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: child,
    );
  }
}
