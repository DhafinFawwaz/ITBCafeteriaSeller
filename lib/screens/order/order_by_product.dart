import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/const.dart';

class Order_Product extends StatefulWidget {
  @override
  State<Order_Product> createState() => _Order_ProductState();
}

class _Order_ProductState extends State<Order_Product> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
}

class Product extends StatelessWidget {
  final int jumlah;
  final String namaProduk;
  const Product({super.key, required this.jumlah, required this.namaProduk});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: 61,
            height: 60,
            color: Color(0xffFF7676)),
        Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            margin: EdgeInsets.only(top: 20),
            width: 300,
            height: 60,
            color: greyColor,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(namaProduk,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              Text("Jumlah : $jumlah")
            ])),
      ],
    );
  }
}
