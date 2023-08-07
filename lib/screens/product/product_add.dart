import 'package:flutter/material.dart';
import 'package:itb_cafeteria_seller/data/StaticData.dart';
import 'package:itb_cafeteria_seller/model/profile/profile_edit_model.dart';
import 'package:itb_cafeteria_seller/utils/GlobalTheme.dart';

import '../../model/product/product_add_model.dart';
import '../../services/api_service.dart';
import '../../widgets/normal_button.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});


  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name = "";
  String? description = "";
  double? price = 5000;
  int? quantity = 1;
  String? imageLink = "";
  int locationId = 1;
  int categoryId = 1;
  String imagePath = "https://cms.zsl.org/sites/default/files/styles/responsive/public/592/560/1/2023-02/Dominica%201%20%2828%29.jpg?itok=UG4tIicq";

  void onSubmit() async
  {
    if(validateAndSave()) {

      ProductAddRequest model = ProductAddRequest(
        shopId : 0,
        locationId : locationId!,
        categoryId : categoryId!,
        name : name!,
        description : description!,
        image: imagePath!,
        price : price!,
        quantity : quantity!,
      );

      APIService.addProduct(model).then((response) => {

        if(response.message != "success") {
          onEditFailed(response)
        }
        else {
          onEditSuccess()
        }
      });
    }
  }

  void onEditFailed(ProductAddResponse response) {
    var snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onEditSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Product added successfully"),
    ));

    Navigator.pop(context);
  }

  bool validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Product',
          style: TextStyle(
            color: Colors.black,
          )
        ),
        elevation: 0,
        backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
      ),

      body: Container(
        color: GlobalTheme.slate100,
        child: Padding(
          padding: EdgeInsets.all(GlobalTheme.padding1),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Your name',
                    labelText: 'Product Name'
                  ),
                  initialValue: "",
                  onSaved: (value) => name = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Describe your product',
                    labelText: 'Description'
                  ),
                  initialValue: "",
                  onSaved: (value) => description = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Price',
                    labelText: 'Price'
                  ),
                  initialValue: "",
                  onSaved: (value) => price = double.parse(value == null ? "0" : value),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    labelText: 'Quantity'
                  ),
                  initialValue: "",
                  onSaved: (value) => quantity = int.parse(value == null ? "0" : value),
                ),
                const SizedBox(height: 20),
                DropdownButton<String?>(
                  value: StaticData.locationById[locationId-1],
                  elevation: 0,
                  hint: Text("Location"),
                  items: StaticData.locationById.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      locationId = StaticData.locationById.indexOf(value!) + 1;
                  });
                  },
                ),
                DropdownButton<String?>(
                  value: StaticData.categoryById[categoryId-1],
                  elevation: 0,
                  hint: Text("Location"),
                  items: StaticData.categoryById.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      categoryId = StaticData.categoryById.indexOf(value!) + 1;
                  });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onSubmit,
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalTheme.primaryColor,
                    shadowColor: Colors.transparent,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  ).copyWith(
                      elevation: ButtonStyleButton.allOrNull(0.0)
                  ),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
                
              ],
            ),
          ),
        )
      ),
    );
  }
}