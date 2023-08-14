import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/model/cart/cart_model.dart';
import 'package:itb_cafeteria_seller/services/api_service.dart';
import 'package:itb_cafeteria_seller/utils/GlobalTheme.dart';
import 'package:itb_cafeteria_seller/widgets/rounded_button2.dart';

import '../../model/cart/edit_cart_status_model.dart';

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

  Widget statusButton(String title, String subtitle, bool isActive, VoidCallback onTap) {
    return InkWell(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: ListTile(
            title: Text(title, style: TextStyle(fontWeight: FontWeight.w700),),
            subtitle: Text(subtitle),
            trailing: isActive ? Icon(Icons.circle_rounded) : Icon(Icons.circle_outlined),
          ),
        ),
      ),
    );
  }

  void onUbahStatus (Data data, int statusId) async {
    await APIService.editCartStatus(
      EditCartStatusRequest(
        id: data.id, 
        cartStatusId: statusId
      )
    );
    
    cartResponse = await APIService.getOnHoldCart();
    setState(() {
      
    });
  }

  void onShowBottomSheet (Data data) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: GlobalTheme.slate200, // <-- SEE HERE
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => SizedBox(
            height: 280,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  statusButton("Pending", "Sudah dipeasn, sedang dibuat", data.cartStatusId == 2, () {onUbahStatus(data, 2);}),
                  const SizedBox(height: 15,),
                  statusButton("Selesai", "Pesanan sudah selesai dibuat, bisa diambil", data.cartStatusId == 3, () {onUbahStatus(data, 3);}),
                  const SizedBox(height: 15,),
                  statusButton("History", "Pesanan sudah diambil", data.cartStatusId == 4, () {onUbahStatus(data, 4);}),
                ],
              ),
            ),
          ),
        );
      });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
          cartResponse == null ? const Center(child: CircularProgressIndicator()) 
          : 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: GlobalTheme.padding1, vertical: 5),
            child: ListView.builder(
              
              itemCount: cartResponse!.data!.length,
              itemBuilder: (context, index) =>  Material(
                  color: GlobalTheme.slate200,
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      print("object");
                    },
                    child: Container(
                      
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(

                          children: [
                            Container(
                              width: 200,
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(cartResponse!.data![index].username, style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 4),
                                  getAllOrder(cartResponse!.data![index]),
                                  const SizedBox(height: 8),
                                  getTimeMessage(cartResponse!.data![index].pickupAt),
                                  const SizedBox(height: 2),
                                  getPaymentMessage(cartResponse!.data![index].paymentMethodId),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              
                              children: [
                                  getCartStatus(cartResponse!.data![index].cartStatusId),
                                  
                                  RoundedButton2(text: "Ubah Status", borderRadius: BorderRadius.circular(50), 
                                    textColor: Colors.white, onPressed: () {onShowBottomSheet(cartResponse!.data![index]);}, height: 14, width: 77
                                  ),
                                ],
                              ),
                            
                          ]


                        ),
                      ),
                    ),
                  ),
              ),
            ),
          )
      
      
      ),
    );
  }
}

getCartStatus(int cartStatusId) {
  if(cartStatusId == 1) return Text("Di keranjang", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900));
  if(cartStatusId == 2) return Text("Pending", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900));
  if(cartStatusId == 3) return Text("Selesai", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w900));
  return Text("History");
}





getAllOrder(Data data) {
  String message = "";
  for(int i = 0; i < data.orderItem.length; i++) {
    message += data.orderItem[i].quantity.toString() + " " + data.orderItem[i].productName + " + ";
  }
  message.substring(0, message.length - 5);
  return Text(message);
}

getTimeMessage(String pickupAt) {
  return Text(pickupAt, style: TextStyle(color: Colors.black));
}

getPaymentMessage(int paymentMethodId) {
  return Text('Metode pembayaran: ${(paymentMethodId == 0) ? 'Cash' : (paymentMethodId == 1) ? 'GOPAY': 'QRIS'}', style: const TextStyle(color: Colors.black));
}


