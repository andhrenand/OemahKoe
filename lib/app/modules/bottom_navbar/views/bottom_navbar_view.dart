import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oemah_koe/app/modules/bookmark/views/bookmark_view.dart';
import 'package:oemah_koe/app/modules/home/views/home_view.dart';
import 'package:oemah_koe/app/modules/living_page/views/living_page_view.dart';
import 'package:oemah_koe/app/modules/profile/views/profile_view.dart';
import 'package:oemah_koe/app/modules/search_list/views/search_list_view.dart';
import 'package:oemah_koe/app/shared/themes/app_theme.dart';

import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarView extends GetView<BottomNavbarController> {
  const BottomNavbarView({super.key});

  List<Widget> get pages => [
    const HomeView(),
    const SearchListView(),
    const LivingPageView(),
    const BookmarkView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() {
        final isActive = controller.selectedIndex.value == 2;

        return Transform.translate(
          offset: const Offset(0, 4),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => controller.changeIndex(2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.surface,
                      border: Border.all(
                        color: isActive
                            ? AppTheme.gold.withValues(alpha: 0.55)
                            : AppTheme.divider,
                        width: 1.4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.shadow,
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.weekend_rounded,
                      color: isActive ? AppTheme.gold : AppTheme.faintText,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppTheme.divider),
            boxShadow: [
              BoxShadow(
                color: AppTheme.shadow,
                blurRadius: 28,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(child: _sideNavItem(icon: Icons.home_rounded, index: 0)),
              Expanded(child: _sideNavItem(icon: Icons.search_sharp, index: 1)),
              const SizedBox(width: 94),
              Expanded(child: _sideNavItem(icon: Icons.bookmark, index: 3)),
              Expanded(
                child: _sideNavItem(
                  icon: Icons.person_outline_rounded,
                  index: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sideNavItem({required IconData icon, required int index}) {
    return Obx(() {
      final isActive = controller.selectedIndex.value == index;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: isActive
              ? AppTheme.gold.withValues(alpha: 0.14)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isActive
                ? AppTheme.gold.withValues(alpha: 0.28)
                : Colors.transparent,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () => controller.changeIndex(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 23,
                  color: isActive ? AppTheme.gold : AppTheme.faintText,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      );
    });
  }
}
