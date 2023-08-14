import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itb_cafeteria_seller/model/cart/edit_cart_status_model.dart';
import 'package:itb_cafeteria_seller/model/product/product_add_model.dart';
import 'package:itb_cafeteria_seller/model/product/product_model.dart';

import '../config/config.dart';
import '../data/StaticData.dart';
import '../model/cart/cart_model.dart';
import '../model/login_model.dart';
import '../model/profile/profile_edit_model.dart';
import '../model/profile/profile_model.dart';
import '../model/register_model.dart';
import 'shared_service.dart';

class APIService {
  static var client = http.Client();

  static Future<LoginResponse> login(LoginRequest model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': '*/*'
    };
    var uri = Uri.parse(Config.loginURL);

    var response = await client.post(
      uri,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponse(response.body));
    }
    
    StaticData.profileData.message = ""; // to refresh the profile data when entering the profile menu
    return LoginResponse.fromJson(jsonDecode(response.body));
  }

  static Future<RegisterResponse> register(RegisterRequest model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    
    var url = Uri.parse(Config.registerURL);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    print(response.body);

    return registerResponse(response.body);
  }

  static Future<ProfileResponse> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var url = Uri.parse('${Config.profileURL}?id=${loginDetails.data!.id}');
    
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    return ProfileResponse.fromJson(jsonDecode(response.body));
  }


  static Future<ProfileEditResponse> editUserProfile(ProfileEditRequest model) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var uri = Uri.parse(Config.editProfileURL);
    model.id = loginDetails.data!.id;

    var response = await client.post(
      uri,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return ProfileEditResponse.fromJson(jsonDecode(response.body));
  }

  static Future<String> editUserImageProfile(String path) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var uri = Uri.parse('${Config.editProfileImageURL}?id=${loginDetails.data!.id}');


    http.MultipartRequest request = http.MultipartRequest("POST", uri);

    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'image', path);

    request.files.add(multipartFile);
    request.headers.addAll(requestHeaders);

    var streamedResponse = await client.send(request);

    var response = await http.Response.fromStream(streamedResponse);
    return jsonDecode(response.body)["data"]["image"];
  }

  static Future<ProductResponse> getOwnedProduct() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var url = Uri.parse('${Config.ownedProductURL}?shop_id=${loginDetails.data!.id}');
    
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    return ProductResponse.fromJson(jsonDecode(response.body));
  }

  static Future<CartResponse> getOnHoldCart() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var url = Uri.parse('${Config.cartOrderURL}?shop_id=${loginDetails.data!.id}');
    
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    return CartResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ProductAddResponse> addProduct(ProductAddRequest model) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var uri = Uri.parse(Config.addProductURL);
    model.shopId = loginDetails.data!.id;

    http.MultipartRequest request = http.MultipartRequest("POST", uri);

    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'image', model.image);

    request.files.add(multipartFile);
    request.headers.addAll(requestHeaders);

    Map<String, String> body = {
      "shop_id": model.shopId.toString(),
      "location_id": loginDetails.data!.locationId.toString(),
      "category_id": model.categoryId.toString(),
      "name": model.name,
      "description": model.description,
      "image": model.image,
      "price": model.price.toString(),
      "quantity": model.quantity.toString(),
    };
    request.fields.addAll(body);

    var streamedResponse = await client.send(request);

    var response = await http.Response.fromStream(streamedResponse);

    return ProductAddResponse.fromJson(jsonDecode(response.body));
  }

  static Future<EditCartStatusResponse> editCartStatus(EditCartStatusRequest model) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.data!.token}',
    };

    var uri = Uri.parse(Config.editCartStatusURL);

    var response = await client.post(
      uri,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return EditCartStatusResponse.fromJson(jsonDecode(response.body));
  }

}