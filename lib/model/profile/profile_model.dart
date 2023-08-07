class ProfileResponse {
  ProfileResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;
  
  ProfileResponse.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.locationId,
    required this.username,
    required this.password,
    required this.email,
    required this.telephone,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.modifiedAt,
  });
  late int id;
  late int locationId;
  late String username;
  late String password;
  late String email;
  late String telephone;
  late String description;
  late String image;
  late DateTime createdAt;
  late DateTime modifiedAt;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    locationId = json['location_id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    telephone = json['telephone'];
    description = json['description'];
    image = json['image'];
    createdAt = DateTime.parse(json['created_at']);
    modifiedAt = DateTime.parse(json['modified_at']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['location_id'] = locationId;
    _data['username'] = username;
    _data['password'] = password;
    _data['email'] = email;
    _data['telephone'] = telephone;
    _data['description'] = description;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['modified_at'] = modifiedAt;
    return _data;
  }
}