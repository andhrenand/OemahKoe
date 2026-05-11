import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oemah_koe/app/data/dummy_data.dart';
import 'package:oemah_koe/app/modules/living_page/controllers/living_page_controller.dart';
import 'package:oemah_koe/app/routes/app_pages.dart';
import 'package:oemah_koe/app/shared/helper/rupiah_converter.dart';
import 'package:oemah_koe/app/shared/themes/app_theme.dart';

class LivingPageView extends GetView<LivingPageController> {
  const LivingPageView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Living',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ContainerPayRent(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Essentials Shop',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Fulfill your daily needs effortlessly \nwith Oemah',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppTheme.mutedText,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PAYMENT);
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                          size: 30,
                        ),

                        Positioned(
                          right: -2,
                          top: -10,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 18,
                              minHeight: 18,
                            ),
                            child: const Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              GridView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    titleProduct:
                        product['nameProduct'] as String? ?? 'Product',
                    categoryProduct: product['category'] as String? ?? '-',
                    image:
                        product['image'] as String? ??
                        product['images'] as String? ??
                        'assets/images/product(1).png',
                    price: product['price'] as int? ?? 0,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerPayRent extends StatelessWidget {
  const ContainerPayRent({super.key});

  @override
  Widget build(BuildContext context) {
    final int amount = 20000000;
    final int lateFee = 500000;
    final bool isLate = dummyUser['rentStatus'] == 'late';
    final String propertyName =
        dummyUser['propertyLived'] as String? ?? 'Your Residence';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.divider),
        boxShadow: [
          BoxShadow(
            color: AppTheme.shadow,
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// LEFT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER (label + status)
                Row(
                  children: [
                    Text(
                      'RENT PAYMENT',
                      style: TextStyle(
                        color: AppTheme.gold,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isLate
                            ? Colors.red.withValues(alpha: 0.1)
                            : Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        isLate ? "OVERDUE" : "DUE",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isLate ? Colors.red : Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// PROPERTY NAME
                Text(
                  propertyName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                /// AMOUNT
                Text(
                  formatRupiah(amount),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// LATE INFO
                if (isLate)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '+ ${formatRupiah(lateFee)} late fee',
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),

                const SizedBox(height: 6),

                /// DATE INFO
                Text(
                  isLate ? 'Was due April 2026' : 'Due April 2026',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          /// BUTTON
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.PAYMENT),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.gold,
              foregroundColor: AppTheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Pay',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String titleProduct;
  final String categoryProduct;
  final String image;
  final int price;

  const ProductCard({
    super.key,
    required this.titleProduct,
    required this.categoryProduct,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.divider),
        boxShadow: const [
          BoxShadow(
            color: AppTheme.shadow,
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 10),

          // TITLE
          Text(
            titleProduct,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 2),

          // CATEGORY
          Text(
            categoryProduct,
            style: TextStyle(fontSize: 11, color: AppTheme.mutedText),
          ),

          const Spacer(),

          // PRICE + BUTTON
          Row(
            children: [
              Text(
                formatRupiah(price),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),

              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppTheme.gold,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 18,
                    color: AppTheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
