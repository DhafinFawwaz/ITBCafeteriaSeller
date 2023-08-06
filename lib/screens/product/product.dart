import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/screens/auth/login.dart';
import 'package:itb_cafeteria_seller/screens/kantin/kantin.dart';
import 'package:itb_cafeteria_seller/utils/GlobalTheme.dart';
import 'package:itb_cafeteria_seller/widgets/ink_well_button.dart';
import 'package:itb_cafeteria_seller/widgets/normal_button.dart';
import '../../widgets/custom_menu_base.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  void loadKantin(int locationId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => KantinPage(locationId: locationId),
      ),
    );
  }

  Widget buildFood() {
    return Container(
        child: InkWellButton(
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 102,
                  decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nasi Goreng",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Jumlah: 1"),
                    ],
                  ),
                )
              ],
            )));
  }

  Widget buildAdd() {
    return Container(
        child: InkWellButton(
            onPressed: () {},
            child: Center(
              child: Text(
                "+",
                style: TextStyle(fontSize: 100),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return CustomMenuBase(
      hoveringChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product",
              style: TextStyle(
                  fontSize: GlobalTheme.fontsize1,
                  fontWeight: FontWeight.bold)),
          FloatingActionButton(onPressed: () {
            Navigator.pushNamed(context, "/login");
          })
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: List.generate(24, (index) {
            if (index == 23) {
              return buildAdd();
            }
            return buildFood();
          }),
        ),
      ),
    );
  }
}
