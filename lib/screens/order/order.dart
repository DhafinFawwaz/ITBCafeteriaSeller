import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/screens/order/order_by_consumer.dart';
import 'package:itb_cafeteria_seller/screens/order/order_by_product.dart';
import 'package:itb_cafeteria_seller/const.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  // void loadKantin(int locationId) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (BuildContext context) => KantinPage(locationId: locationId),
  //     ),
  //   );
  // }

  //   Widget buildFood() {
  //     return Container(
  //       margin: EdgeInsets.symmetric(horizontal: GlobalTheme.padding1, vertical: 10),
  //       child: InkWellButton(
  //         onPressed: () {},
  //         child: Padding(
  //           padding: EdgeInsets.all(18),
  //           child: Row(
  //             children: [
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text("Maulvi", style: TextStyle(fontWeight: FontWeight.w800),),
  //                   SizedBox(height: 3),
  //                   Text("Di ambil pada 09.30 AM"),
  //                   SizedBox(height: 3),
  //                   Text("Metode pembayaran: Gopay"),
  //                 ],
  //               ),
  //               Spacer(),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text("Pending"),
  //                   SizedBox(height: 30,),
  //                 ],
  //               ),
  //             ]
  //           ),
  //         ),
  //       )
  //     );
  //   }

  // @override
  // Widget build(BuildContext context) {
  //   return CustomMenuBase(
  //     hoveringChild: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           "Orders",
  //           style: TextStyle(
  //             fontSize: GlobalTheme.fontsize1,
  //             fontWeight: FontWeight.bold
  //           )
  //         ),

  //       ],
  //     ),
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           buildFood(),
  //           buildFood(),
  //           buildFood(),
  //           buildFood(),
  //           buildFood(),
  //           buildFood(),
  //           buildFood(),
  //           buildFood(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  List<String> items = ["By Consumers", "By Products"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          bottomNavigationBar: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(blurRadius: 5)]),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xffFFFFFF),
                  child: Container(
                    width: double.infinity,
                    height: 17,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/LeftArrow.png'))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 30),
                child: Text(
                  "Orders",
                  style: TextStyle(
                      fontFamily: 'inter-black',
                      fontSize: 24,
                      fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                height: 39,
                child: TabBar(
                  unselectedLabelColor: blackColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      border: Border.all(
                        color: orangeColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  tabs: [
                    Tab(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(2, 2, 2, 0),
                        decoration: BoxDecoration(
                          color: Color(0xF3F3F3),
                          border:
                              Border.all(color: Color(0xffDADADA), width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "By Consumers",
                            style: TextStyle(color: blackColor),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(2, 2, 2, 0),
                        decoration: BoxDecoration(
                          color: Color(0xF3F3F3),
                          border:
                              Border.all(color: Color(0xffDADADA), width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "By Products",
                            style: TextStyle(color: blackColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [Order_Consumer(), Order_Product()],
              ))
            ],
          ),
        ));
  }
}
