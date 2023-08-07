class ProductAddRequest {
  ProductAddRequest({
    required this.shopId,
    required this.locationId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
  });
  late int shopId;
  late final int locationId;
  late final int categoryId;
  late final String name;
  late final String description;
  late final String image;
  late final double price;
  late final int quantity;
  
  ProductAddRequest.fromJson(Map<String, dynamic> json){
    shopId = json['shop_id'];
    locationId = json['location_id'];
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = double.parse(json['price']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['shop_id'] = shopId;
    _data['location_id'] = locationId;
    _data['category_id'] = categoryId;
    _data['name'] = name;
    _data['description'] = description;
    _data['image'] = image;
    _data['price'] = price;
    _data['quantity'] = quantity;
    return _data;
  }
}

class ProductAddResponse {
  ProductAddResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;
  
  ProductAddResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.shopId,
    required this.locationId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.image,
  });
  late final int shopId;
  late final int locationId;
  late final int categoryId;
  late final String name;
  late final String description;
  late final int price;
  late final int quantity;
  late final String image;
  
  Data.fromJson(Map<String, dynamic> json){
    shopId = json['shop_id'];
    locationId = json['location_id'];
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
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