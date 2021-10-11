import 'dart:convert';

import 'package:assingment/Model/Token/token_main.dart';
import 'package:assingment/Model/User/user.dart';
import 'package:assingment/Model/User/user_list_main.dart';
import 'package:assingment/Model/User/user_main.dart';
import 'package:assingment/Service/service_base.dart';
import 'package:assingment/Service/service_url.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ServiceDB implements ServiceBase {
  final Map<String, String> headers = {
    "content-type": "application/json",
    "accept": "application/json",
  };

  final ServiceUrl _serviceUrl = ServiceUrl();

  @override
  Future<UserMain?> addToFriends(String userId) async {
    var response = await http.post(Uri.parse(_serviceUrl.addToFriends),
        body: jsonEncode({"UserId": userId}), headers: await headerToken());

    try {
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      UserMain main = UserMain.fromJson(responseData);

      if (main.hasError!) {
        return null;

      } else {
        return main;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<UserMain?> removeFromFriends(String userId) async {
    var response = await http.post(Uri.parse(_serviceUrl.removeFromFriends),
        body: jsonEncode({"UserId": userId}), headers: await headerToken());
    try {
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      UserMain main = UserMain.fromJson(responseData);
      if (main.hasError!) {
        return null;

      } else {
        return main;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> getAccount() async {
    try {
      var response = await http.get(Uri.parse(_serviceUrl.getAccount),
          headers: await headerToken());
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      UserMain main = UserMain.fromJson(responseData);
      if (main.hasError!) {
        return null;

      } else {
        return main.data;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<User>?> getUsers() async {
    try {
      var response = await http.get(Uri.parse(_serviceUrl.getUsers),
          headers: await headerToken());

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      UserListMain main = UserListMain.fromJson(responseData);
      if (main.hasError!) {
        return null;

      } else {
        return main.data;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<TokenMain?> signIn(String email, String password) async {
    try {
      var response = await http.post(Uri.parse(_serviceUrl.signIn),
          body: jsonEncode({"Email": email, "Password": password}),
          headers: headers);

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      TokenMain main = TokenMain.fromJson(responseData);
      if (main.hasError!) {
        return null;

      } else {
        return main;
      }
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, String>> headerToken() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');

    return <String, String>{
      "content-type": "application/json",
      "accept": "application/json",
      "Authorization": "Bearer " + token!
    };
  }
}
