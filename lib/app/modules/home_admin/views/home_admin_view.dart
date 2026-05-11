import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  const HomeAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 60, 20, 20) ,
            decoration: BoxDecoration(color: Colors.brown),
            child: Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .start,
                  children: [
                    Text("Selamat datang juragan kos"),
                    Text("Andhika Renan")
                  ],
                ),
                Spacer(),
                Material(
                  color: Colors.white,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(5),
                    child: Icon(Icons.notifications, size: 25,)))

              ],
            ),
          )
        ],
      ),
    );
  }
}
