import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oemah_koe/app/shared/themes/app_theme.dart';
import 'package:oemah_koe/app/shared/widgets/primary_button.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Bag'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CartItemCard(),
              SizedBox(height: 10),
              CartItemCard(),
              SizedBox(height: 10),
              CartItemCard(),
              SizedBox(height: 20),
              Text(
                "Payment Method",
                style: TextStyle(fontSize: 20, fontWeight: .w700),
              ),
              SizedBox(height: 10),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PaymentMethodCard(
                      title: "QRIS",
                      icon: Icons.qr_code_2,
                      isSelected: controller.selectedPayment.value == 0,
                      onTap: () => controller.selectPayment(0),
                    ),
                    PaymentMethodCard(
                      title: "Cash",
                      icon: Icons.payments,
                      isSelected: controller.selectedPayment.value == 1,
                      onTap: () => controller.selectPayment(1),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Order Summary",
                style: TextStyle(fontSize: 20, fontWeight: .w800),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(20),
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
                  children: [
                    Row(
                      children: [
                        Text(
                          "Subtotal",
                          style: TextStyle(color: AppTheme.faintText),
                        ),
                        Spacer(),
                        Text("Rp. 50.000.000"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Service",
                          style: TextStyle(color: AppTheme.faintText),
                        ),
                        Spacer(),
                        Text("Rp. 50.000.000"),
                      ],
                    ),
                                        SizedBox(height: 10),

                    Row(
                      children: [
                        Text(
                          "Diskon",
                          style: TextStyle(color: AppTheme.faintText),
                        ),
                        Spacer(),
                        Text("Rp. 10.000,00"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Total Payment",
                          style: TextStyle(fontSize: 15, fontWeight: .w700),
                        ),
                        Spacer(),
                        Text(
                          "Rp. 70.000.000",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: .w700,
                            color: AppTheme.gold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              PrimaryButton(title: "PAY"),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.shadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/images/product(1).png",
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          /// TEXT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Aqua Galon",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),

                const SizedBox(height: 4),

                Text(
                  "Food & Beverages",
                  style: TextStyle(fontSize: 12, color: AppTheme.mutedText),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Rp 50.000",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// QUANTITY CONTROL
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                _qtyButton(Icons.remove),
                const SizedBox(width: 6),
                const Text("1", style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 6),
                _qtyButton(Icons.add),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppTheme.gold,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, size: 16, color: AppTheme.onPrimary),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const PaymentMethodCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 100,
        width: 110,
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : AppTheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppTheme.primary : AppTheme.divider,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: isSelected ? Colors.white : Colors.black,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
