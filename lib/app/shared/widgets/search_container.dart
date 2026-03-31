import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),label: Text("What are you looking for?")),
    );
  }
}
