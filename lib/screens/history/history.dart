import 'package:itb_cafeteria_seller/utils/GlobalTheme.dart';
import 'package:itb_cafeteria_seller/widgets/ink_well_button.dart';
import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/const.dart';
import '../../widgets/custom_menu_base.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
        Widget buildHistory() {
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
                        Text("1 Kopi, 1 Nasi ayam"),
                        SizedBox(height: 3),
                        Text("Rp45.000", style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(height: 3),
                        Text("29 Feb 09:23 AM"),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Selesai", style: TextStyle(fontWeight: FontWeight.w800),),
                        SizedBox(height: 3),
                        Text("Pesanan A-120412")
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
          Text('History', style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
              ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              InkWellButton(
                  onPressed: () {},
                  child: Padding( padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    child: Row( children: <Widget>[
                      Text(
                        "Tanggal",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ]))),

              SizedBox(width: 10.0),

              InkWellButton(
                  onPressed: () {},
                  child: Padding( padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    child: Row( children: <Widget>[
                      Text(
                        "Metode",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                    ]))),

            ],
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHistory(),
            buildHistory(),
            buildHistory(),
            buildHistory(),
            buildHistory(),
            buildHistory(),
            buildHistory(),
            buildHistory(),
            buildHistory(),
            buildHistory(),
          ],
        ),
      ),
    );
  }
}