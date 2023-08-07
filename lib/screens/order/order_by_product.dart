import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/const.dart';
import 'package:itb_cafeteria_seller/screens/order/statusOrder.dart';
import 'package:itb_cafeteria_seller/widgets/rounded_button.dart';

class Order_Product extends StatefulWidget {
  @override
  State<Order_Product> createState() => _Order_ProductState();
}

class _Order_ProductState extends State<Order_Product> {
  final List<int> listjumlah = [10, 20, 10, 5];
  final List<String> listProduk = [
    "Nasi Goreng",
    "Mie Goreng",
    "Aqua",
    "Sate Goreng"
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(left: 30, top: 20),
            child: ListView(children: [
              for (var i = 0; i < listProduk.length; i++)
                Product(jumlah: listjumlah[i], namaProduk: listProduk[i])
            ])));
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
            width: 92,
            height: 93,
            color: greyColor),
        Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            margin: EdgeInsets.only(top: 20),
            width: 250,
            height: 93,
            color: Color(0xfff3f3f3),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(namaProduk,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              Text("Jumlah : $jumlah"),
              RoundedButton(
                  text: "Status",
                  borderRadius: BorderRadius.circular(22),
                  color: Color(0xffF87328),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StatusOrder()));
                  },
                  height: 23,
                  width: 98)
            ])),
      ],
    );
  }
}
