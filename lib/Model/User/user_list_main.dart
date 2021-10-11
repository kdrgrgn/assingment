
import 'package:assingment/Model/User/user.dart';

class UserListMain {
  List<dynamic>? validationErrors;
  bool? hasError;
  dynamic? message;
  List<User>? data;

  UserListMain({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data});

  UserListMain.fromJson(dynamic json) {

    validationErrors = json["validationErrors"];
    hasError = json["HasError"];
    message = json["Message"];

    if (json["Data"] != null) {
      data = [];
      json["Data"].forEach((v) {
        data?.add(User.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (validationErrors != null) {
      map["ValidationErrors"] = validationErrors?.map((v) => v.toJson()).toList();
    }
    map["HasError"] = hasError;
    map["Message"] = message;
    if (data != null) {
      map["Data"] = data?.map((v) => v.toJson()).toList();
    }

    return map;
  }

}