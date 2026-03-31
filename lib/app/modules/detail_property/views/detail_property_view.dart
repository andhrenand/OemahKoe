import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_property_controller.dart';

class DetailPropertyView extends GetView<DetailPropertyController> {
  const DetailPropertyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPropertyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailPropertyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
