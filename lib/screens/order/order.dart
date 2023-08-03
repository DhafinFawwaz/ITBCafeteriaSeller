import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/screens/kantin/kantin.dart';
import 'package:itb_cafeteria_seller/utils/GlobalTheme.dart';
import 'package:itb_cafeteria_seller/widgets/ink_well_button.dart';
import 'package:itb_cafeteria_seller/widgets/normal_button.dart';
import '../../widgets/custom_menu_base.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}


class _OrderState extends State<Order> {

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
        margin: EdgeInsets.symmetric(horizontal: GlobalTheme.padding1, vertical: 10),
        child: InkWellButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Maulvi", style: TextStyle(fontWeight: FontWeight.w800),),
                    SizedBox(height: 3),
                    Text("Di ambil pada 09.30 AM"),
                    SizedBox(height: 3),
                    Text("Metode pembayaran: Gopay"),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pending"),
                    SizedBox(height: 30,),
                  ],
                ),
              ]
            ),
          ),
        )
      );
    }
  
  @override
  Widget build(BuildContext context) {
    return CustomMenuBase(
      hoveringChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Orders",
            style: TextStyle(
              fontSize: GlobalTheme.fontsize1,
              fontWeight: FontWeight.bold
            )
          ),
          
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildFood(),
            buildFood(),
            buildFood(),
            buildFood(),
            buildFood(),
            buildFood(),
            buildFood(),
            buildFood(),
          ],
        ),
      ),
    );
  }
}