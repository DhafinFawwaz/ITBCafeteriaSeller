import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/model/cart/cart_model.dart';
import 'package:itb_cafeteria_seller/services/api_service.dart';
import 'package:itb_cafeteria_seller/const.dart';
import 'package:itb_cafeteria_seller/widgets/rounded_button.dart';
import 'package:itb_cafeteria_seller/screens/order/statusOrder.dart';

class Order_Consumer extends StatefulWidget {
  @override
  State<Order_Consumer> createState() => _Order_ConsumerState();
}

class _Order_ConsumerState extends State<Order_Consumer> {
  CartResponse? cartResponse;
  List<String> listNama = ["Ridho", "Maulvi", "Ojan"];
  List<String> listProduct = ["1 kopi, 1 donat", "1 donat, 2 ayam", "1 kucing"];
  List<String> description = ["Cash", "Transfer", "Cash"];

  void refresh() async {
    cartResponse = await APIService.getOnHoldCart();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return Scaffold(
    //   body: Center(
    //     child:
    //       cartResponse == null ? const Center(child: CircularProgressIndicator()) : Text(cartResponse!.data!.length.toString()),
    //   ),
    // );
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(left: 30, top: 20),
            child: ListView(children: [
              for (var i = 0; i < listNama.length; i++)
                Consume(
                  jumlah: listProduct[i],
                  namaProduk: listNama[i],
                  payDescription: description[i],
                )
            ])));
  }
}

class Consume extends StatelessWidget {
  final String jumlah;
  final String namaProduk;
  final String payDescription;
  const Consume(
      {super.key,
      required this.jumlah,
      required this.namaProduk,
      required this.payDescription});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(left: 10, top: 5),
            margin: EdgeInsets.only(top: 20),
            width: 350,
            height: 100,
            decoration: BoxDecoration(
                color: Color(0xfff3f3f3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: greyColor)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(namaProduk,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              "Jumlah : $jumlah",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text("Metode Pembayaran: $payDescription"),
                        )
                      ]),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 10, top: 5),
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
