import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/config.dart';
import '../model/login_model.dart';
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
    return registerResponse(response.body);
  }

  static Future<String> getUserProfile() async {
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


    if(response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }

  }

}