import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oemah_koe/app/data/dummy_data.dart';
import 'package:oemah_koe/app/modules/home/widget/category_button.dart';
import 'package:oemah_koe/app/modules/home/widget/city_tile.dart';
import 'package:oemah_koe/app/modules/home/widget/property_card.dart';
import 'package:oemah_koe/app/routes/app_pages.dart';
import 'package:oemah_koe/app/shared/themes/app_theme.dart';
import 'package:oemah_koe/app/shared/widgets/search_container.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filteredProperties = controller.filteredData;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/background_header.png"),
                  fit: BoxFit.cover,
                  opacity: 0.9,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome back, ${dummyUser['name']}",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  "${dummyUser['location']}, Indonesia",
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                "${dummyUser["profilePict"]}",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const SearchContainer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryButton(
                        onPressed: () {
                          Get.toNamed(Routes.LIST_PROPERTY, arguments: "House");
                        },
                        icon: Icons.house,
                        titleCategory: "House",
                      ),
                      CategoryButton(
                        onPressed: () {
                          Get.toNamed(Routes.LIST_PROPERTY, arguments: "Apartment"
                          ); // atau sesuai category
                        },
                        icon: Icons.apartment,
                        titleCategory: "Apartment",
                      ),
                      CategoryButton(
                        icon: Icons.hotel,
                        titleCategory: "Kost",
                        onPressed: () {
                          Get.toNamed(Routes.LIST_PROPERTY, arguments: "Kost");
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Text(
                        "Recommend for you",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {Get.toNamed(Routes.LIST_PROPERTY, arguments: "All");},
                        child: const Text("View More"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 280,
                    child: ListView.separated(
                      controller: ScrollController(),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: dummyProperties.length > 3
                          ? 3
                          : dummyProperties.length,
                      itemBuilder: (context, index) {
                        final item = dummyProperties[index];
                        return Align(
                          child: PropertyCard(
                            property: item,
                            title: item['title'] as String,
                            location: item['location'] as String,
                            image: item['image'] as String,
                            price: item['price'] as int,
                            bedroom: item['bedroom'] as int,
                            bathroom: item['bathroom'] as int,
                            size: item['size'] as int?,
                            onTap: () {
                              Get.toNamed(
                                Routes.DETAIL_PROPERTY,
                                arguments: item,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 28),

                  Text(
                    "Find based on your location",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: categoriesByCities.length,
                      itemBuilder: (context, index) {
                        final item = categoriesByCities[index];
                        return Align(
                          child: CategoryByCities(
                            city: item['city'],
                            image: item['images'],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 28),

                  Row(
                    children: [
                      Text(
                        "Near by you",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {Get.toNamed(Routes.LIST_PROPERTY, arguments: 'All');},
                        child: const Text("View more"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (filteredProperties.isEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppTheme.divider),
                      ),
                      child: Text(
                        "No nearby properties yet for ${dummyUser["location"]}.",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppTheme.mutedText,
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      height: 280,
                      child: ListView.separated(
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemCount: filteredProperties.length > 2
                            ? 2
                            : filteredProperties.length,
                        itemBuilder: (context, index) {
                          final item = filteredProperties[index];
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
                                Get.toNamed(
                                  Routes.DETAIL_PROPERTY,
                                  arguments: item,
                                );
                              },
                            ),
                          );
                        },
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
