import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:oemah_koe/app/shared/widgets/search_container.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                // ==== HEADER ====
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text("Welcome Back, Renan 👋🏻"),
                        Text("Indonesia, Jakarta"),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(backgroundColor: Colors.black, radius: 20),
                  ],
                ),
                SizedBox(height: 40),
                SearchContainer(),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _CategoryButton(icon: Icons.home, titleCategory: "Home"),
                    _CategoryButton(icon: Icons.home, titleCategory: "Home"),
                    _CategoryButton(icon: Icons.home, titleCategory: "Home"),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Near you"),
                    Spacer(),
                    TextButton(onPressed: (){}, child: Text("View More"))
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _PropertyCard(),
                      SizedBox(width: 10),
                      _PropertyCard(),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("Recommend for you"),
                    Spacer(),
                    TextButton(onPressed: (){}, child: Text("View more"))
                  ],
                )
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget{
  final IconData icon;
  final String titleCategory;

  const _CategoryButton ({
    required this.icon,
    required this.titleCategory,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Icon(icon),
            Text(titleCategory)
          ],
        ),
      ),
    );
  }

}

class _PropertyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 270,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset("assets/images/property(1).png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text("Sentra Timur Residence"),
                  Text("Jakarta Selatan"),
                  Text("4 Bedroom & 3 Bathroom"),
                  Text("Rp.15.000.000/month"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
