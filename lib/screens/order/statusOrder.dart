import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/const.dart';
import 'package:itb_cafeteria_seller/screens/nav/nav.dart';
import 'package:itb_cafeteria_seller/screens/order/order.dart';
import 'package:itb_cafeteria_seller/widgets/rounded_button.dart';

class StatusOrder extends StatefulWidget {
  final int statusIndex = 0;
  String state = "Pending";
  @override
  State<StatusOrder> createState() => _StatusOrderState();
}

class _StatusOrderState extends State<StatusOrder> {
  List<String> titleList = ["Pending", "Ready", "Done"];

  List<String> subtitleList = ["Sedang dibuat", "Sudah siap diambil", "Done"];

  Color orangeColor = Color(0xffF87328);

  Color grayColor = Color(0xffDADADA);

  Color currentBorderColor = Color(0xffDADADA);

  Color currentButtonColor = Colors.transparent;

  Color currentButtonBorderColor = blackColor;

  int _selectedIndex = 0;

  void tapped(bool selected) {
    if (selected) {
      currentBorderColor = orangeColor;
      currentButtonColor = orangeColor;
      currentButtonBorderColor = orangeColor;
    } else {
      currentBorderColor = grayColor;
      currentButtonColor = Colors.transparent;
      currentButtonBorderColor = blackColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Status",
          textAlign: TextAlign.left,
          style: TextStyle(
              color: blackColor,
              fontFamily: 'inter-bold',
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            height: 59,
            margin: EdgeInsets.only(left: 30, right: 40, top: 10),
            decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                border: Border.all(color: Color(0xffDADADA)),
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              selected: index == _selectedIndex,
              selectedColor: orangeColor,
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              title: Text(
                titleList[index],
                style: TextStyle(
                  fontFamily: "inter",
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(subtitleList[index]),
              subtitleTextStyle: TextStyle(
                  fontFamily: 'inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              contentPadding:
                  EdgeInsets.only(bottom: 0, left: 10, right: 10, top: 0),
              trailing: Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                    color: null,
                    shape: BoxShape.circle,
                    border: Border.all(color: blackColor)),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: RoundedButton(
          text: "Confirm",
          borderRadius: BorderRadius.circular(22),
          color: acceptGreen,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NavPage()));
            setState(() {
              StatusOrder().state = titleList[_selectedIndex];
            });
          },
          height: 28,
          width: 300),
    );
  }
}
