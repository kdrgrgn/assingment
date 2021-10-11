
import 'package:assingment/Model/User/user.dart';

/// ValidationErrors : []
/// HasError : false
/// Message : null
/// Data : {"Id":"612754dd4a1c2d346cfd946d","FirstName":"Eren","LastName":"Kaya","FullName":"Eren Kaya","Email":"eren@test.com","BirthDate":"2021-08-26T16:08:00.2059658Z","ProfilePhoto":"https://www.vhv.rs/dpng/d/276-2761771_transparent-avatar-png-vector-avatar-icon-png-png.png","FriendIds":["612754faf2e604021f0f9d5c","612754e8d2016aea00350bc8","61275502b556d5fedc3fd7d8"]}

class UserMain {
  List<dynamic>? validationErrors;
  bool? hasError;
  dynamic? message;
  User? data;

  UserMain({
      this.validationErrors, 
      this.hasError, 
      this.message, 
      this.data});

  UserMain.fromJson(dynamic json) {

    validationErrors = json["validationErrors"];
    hasError = json["HasError"];
    message = json["Message"];
    data = json["Data"] != null ? User.fromJson(json["Data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (validationErrors != null) {
      map["ValidationErrors"] = validationErrors?.map((v) => v.toJson()).toList();
    }
    map["HasError"] = hasError;
    map["Message"] = message;
    if (data != null) {
      map["Data"] = data?.toJson();
    }
    return map;
  }

}