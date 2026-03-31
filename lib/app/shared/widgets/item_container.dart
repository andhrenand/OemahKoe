import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemContainer extends StatelessWidget {
  final String propertyName;
  final String propertyImage;
  final String location;
  final int price;

  const ItemContainer({
    required this.propertyName,
    required this.propertyImage,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 340, minHeight: 240),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              propertyImage,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(propertyName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(location, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Rp ${price.toString().replaceAllMapped(RegExp(r"\\B(?=(\\d{3})+(?!\\d))"), (match) => ".")}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueAccent)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
