import 'token.dart';

/// ValidationErrors : []
/// HasError : false
/// Message : null
/// Data : {"Token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MTI3NTRkZDRhMWMyZDM0NmNmZDk0NmQiLCJmdWxsTmFtZSI6IkVyZW4gS2F5YSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJuYmYiOjE2MzM5NDAzMDQsImV4cCI6MTYzNjUzMjMwNCwiaXNzIjoiaSIsImF1ZCI6ImEifQ.zGl5EW9aqYkXdrPRrP_oA8NnJr9oMd6-TrJM-nRQim0"}

class TokenMain {
  List<dynamic>? validationErrors;
  bool? hasError;
  dynamic? message;
  Token? data;

  TokenMain({
      this.validationErrors, 
      this.hasError, 
      this.message, 
      this.data});

  TokenMain.fromJson(dynamic json) {
    validationErrors = json["validationErrors"];

    hasError = json["HasError"];
    message = json["Message"];
    data = json["Data"] != null ? Token.fromJson(json["Data"]) : null;
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