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
                Product(
                  jumlah: listjumlah[i],
                  namaProduk: listProduk[i],
                  current_index: i,
                )
            ])));
  }
}

class Product extends StatelessWidget {
  final int jumlah;
  final String namaProduk;
  const Product(
      {super.key,
      required this.jumlah,
      required this.namaProduk,
      required this.current_index});
  final int current_index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20),
            width: 92,
            height: 100,
            decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)))),
        Container(
            decoration: const BoxDecoration(
                color: Color(0xfff3f3f3),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            padding: EdgeInsets.only(left: 10, top: 5),
            margin: EdgeInsets.only(top: 20),
            width: 260,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(namaProduk,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                        Text("Jumlah : $jumlah"),
                      ]),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 10, top: 4),
                  child: Column(
                    children: [
                      Text(
                        "Pending",
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RoundedButton(
                          text: "Ubah Status",
                          borderRadius: BorderRadius.circular(22),
                          color: Color(0xffF87328),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StatusOrder()));
                          },
                          height: 23,
                          width: 98)
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }
}
