import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/model/cart/cart_model.dart';
import 'package:itb_cafeteria_seller/services/api_service.dart';

class Order_Consumer extends StatefulWidget {
  @override
  State<Order_Consumer> createState() => _Order_ConsumerState();
}

class _Order_ConsumerState extends State<Order_Consumer> {

  CartResponse? cartResponse;

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
    return Scaffold(
      body: Center(
        child: 
          cartResponse == null ? const Center(child: CircularProgressIndicator()) : Text(cartResponse!.data!.length.toString()),
      ),
    );
  }
}
