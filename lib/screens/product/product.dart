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
      setState(() {});
    });
  }



  Widget buildFood(String name, String price, String quantity, String imageLink, String description) {
    return Container(
        child: InkWellButton(
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(imageLink, fit: BoxFit.cover),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      SizedBox(height: 2,),
                      Text('Stock: ' + quantity),
                      SizedBox(height: 2,),
                      Text('Rp ' + price),
                    ],
                  ),
                )
              ],
            )));
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
    return CustomMenu(
      bottomHoverHeight: 0,
      topHoverHeight: 130,
      
      hoveringChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product",
              style: TextStyle(
                  fontSize: GlobalTheme.fontsize1,
                  fontWeight: FontWeight.bold)),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: GridView.count(
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
      ),
    );
  }
}
