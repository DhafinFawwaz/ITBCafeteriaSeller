class ProductResponse {
  ProductResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final List<ProductData> data;
  
  ProductResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = List.from(json['data']).map((e)=>ProductData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ProductData {
  ProductData({
    required this.id,
    required this.shopId,
    required this.locationId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.image,
  });
  late final int id;
  late final int shopId;
  late final int locationId;
  late final int categoryId;
  late final String name;
  late final String description;
  late final double price;
  late final int quantity;
  late final String image;
  
  ProductData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    shopId = json['shop_id'];
    locationId = json['location_id'];
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    price = double.parse(json['price']);
    quantity = json['quantity'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['shop_id'] = shopId;
    _data['location_id'] = locationId;
    _data['category_id'] = categoryId;
    _data['name'] = name;
    _data['description'] = description;
    _data['price'] = price;
    _data['quantity'] = quantity;
    _data['image'] = image;
    return _data;
  }
}