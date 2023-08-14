import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/model/product/product_model.dart';
import 'package:itb_cafeteria_seller/screens/auth/login.dart';
import 'package:itb_cafeteria_seller/screens/kantin/kantin.dart';
import 'package:itb_cafeteria_seller/screens/product/product_add.dart';
import 'package:itb_cafeteria_seller/services/api_service.dart';
import 'package:itb_cafeteria_seller/utils/GlobalTheme.dart';
import 'package:itb_cafeteria_seller/widgets/ink_well_button.dart';
import 'package:itb_cafeteria_seller/widgets/normal_button.dart';
import '../../widgets/custom_menu.dart';
import '../../widgets/custom_menu_base.dart';
import '../profile/profile_edit.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  void loadKantin(int locationId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => KantinPage(locationId: locationId),
      ),
    );
  }

  ProductResponse? response;

  void refresh() async {
    response = await APIService.getOwnedProduct();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  void onAddProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ProductAdd(),
      ),
    ).then((_) {
      refresh();
    });
  }



  Widget buildFood(String name, String price, String quantity, String imageLink, String description) {
    return InkWellButton(
        onPressed: () {},
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  child: Center(child: Image.network(imageLink, fit: BoxFit.cover, width: 170, height: 120,)),
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      SizedBox(height: 2,),
                      Text('Stock: ' + quantity, style: const TextStyle(fontSize: 12)),
                      SizedBox(height: 2,),
                      Text('Rp ' + price, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                )
              ],
            ),
      );
  }

  Widget buildAdd() {
    return Container(
        child: InkWellButton(
            onPressed: onAddProduct,
            child: Center(
              child: Text(
                "+",
                style: TextStyle(fontSize: 100),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.8,
        
        children: response == null
            ? [buildAdd()]
            :
        
          List.generate(response!.data.length + 1, (index) {
            if (index == response!.data.length) {
              return buildAdd();
            }
              return buildFood(
                response!.data[index].name,
                response!.data[index].price.toString(),
                response!.data[index].quantity.toString(),
                response!.data[index].image,
                response!.data[index].description
              );
            }
          ),
      ),
    );
  }
}
