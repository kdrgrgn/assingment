/// Token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MTI3NTRkZDRhMWMyZDM0NmNmZDk0NmQiLCJmdWxsTmFtZSI6IkVyZW4gS2F5YSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJuYmYiOjE2MzM5NDAzMDQsImV4cCI6MTYzNjUzMjMwNCwiaXNzIjoiaSIsImF1ZCI6ImEifQ.zGl5EW9aqYkXdrPRrP_oA8NnJr9oMd6-TrJM-nRQim0"

class Token {
  String? token;

  Token({
      this.token});

  Token.fromJson(dynamic json) {
    token = json["Token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Token"] = token;
    return map;
  }

}