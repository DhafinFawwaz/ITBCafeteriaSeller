class EditCartStatusRequest {
  EditCartStatusRequest({
    required this.id,
    required this.cartStatusId,
  });
  late final int id;
  late final int cartStatusId;
  
  EditCartStatusRequest.fromJson(Map<String, dynamic> json){
    id = json['id'];
    cartStatusId = json['cart_status_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['cart_status_id'] = cartStatusId;
    return _data;
  }
}

class EditCartStatusResponse {
  EditCartStatusResponse({
    required this.message,
    required this.data,
  });
  late final String message;
  late final EditCartStatusData data;
  
  EditCartStatusResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = EditCartStatusData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class EditCartStatusData {
  EditCartStatusData({
    required this.id,
    required this.cartStatusId,
  });
  late final int id;
  late final int cartStatusId;
  
  EditCartStatusData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    cartStatusId = json['cart_status_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['cart_status_id'] = cartStatusId;
    return _data;
  }
}