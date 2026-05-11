import 'package:flutter/material.dart';
import 'package:oemah_koe/app/shared/helper/rupiah_converter.dart';
import 'package:oemah_koe/app/shared/themes/app_theme.dart';

class PropertyCardVertical extends StatelessWidget {
  final String title;
  final String image;
  final String location;
  final int bedroom;
  final int bathroom;
  final int size;
  final int price;

  const PropertyCardVertical({
    super.key,
    required this.title,
    required this.image,
    required this.location,
    required this.bedroom,
    required this.bathroom,
    required this.size,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppTheme.shadow,
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: .start,
          children: [
            Container(
              height: double.infinity,
              width: 120,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(title, style: TextStyle(fontWeight: .w700)),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: AppTheme.mutedText),
                      Text(
                        location,
                        style: TextStyle(color: AppTheme.mutedText),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.bed, color: AppTheme.mutedText, size: 15),
                      Text(
                        bedroom.toString(),
                        style: TextStyle(color: AppTheme.mutedText),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.bathtub, color: AppTheme.mutedText, size: 15),
                      Text(
                        bathroom.toString(),
                        style: TextStyle(color: AppTheme.mutedText),
                      ),
                      SizedBox(width: 20),
                      Text(formatRupiah(price)),
                    ],
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
