import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/const.dart';
import 'package:itb_cafeteria_seller/screens/product/product.dart';
import 'package:itb_cafeteria_seller/screens/history/history.dart';
import 'package:itb_cafeteria_seller/screens/profile/profile.dart';
import 'package:itb_cafeteria_seller/screens/order/order.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class BottomTab extends StatelessWidget {
  const BottomTab({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(5),
    child: Tab(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    )),
    );
  }
}

class _NavPageState extends State<NavPage> {
  @override
  Widget build(BuildContext context) {
    // hello world in middle text
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: Color(0xffF3F3F3),
            child: TabBar(
              labelColor: orangeColor,
              unselectedLabelColor: blackColor,
              indicatorColor: orangeColor,
              tabs: [
                BottomTab(icon: Icons.fastfood_outlined, text: "Product"),
                BottomTab(icon: Icons.art_track_sharp, text: "Order"),
                BottomTab(icon: Icons.history, text: "History"),
                BottomTab(icon: Icons.person_2_rounded, text: "Profile"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Product(),
              Order(),
              History(),
              Profile(),
            ],
          )),
    );
  }
}
