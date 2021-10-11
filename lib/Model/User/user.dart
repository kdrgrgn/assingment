/// Id : "612754dd4a1c2d346cfd946d"
/// FirstName : "Eren"
/// LastName : "Kaya"
/// FullName : "Eren Kaya"
/// Email : "eren@test.com"
/// BirthDate : "2021-08-26T16:08:00.2059658Z"
/// ProfilePhoto : "https://www.vhv.rs/dpng/d/276-2761771_transparent-avatar-png-vector-avatar-icon-png-png.png"
/// FriendIds : ["612754faf2e604021f0f9d5c","612754e8d2016aea00350bc8","61275502b556d5fedc3fd7d8"]

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? birthDate;
  String? profilePhoto;
  List<String>? friendIds;

  User({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.fullName, 
      this.email, 
      this.birthDate, 
      this.profilePhoto, 
      this.friendIds});

  User.fromJson(dynamic json) {
    id = json["Id"];
    firstName = json["FirstName"];
    lastName = json["LastName"];
    fullName = json["FullName"];
    email = json["Email"];
    birthDate = json["BirthDate"];
    profilePhoto = json["ProfilePhoto"];
    friendIds = json["FriendIds"] != null ? json["FriendIds"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = id;
    map["FirstName"] = firstName;
    map["LastName"] = lastName;
    map["FullName"] = fullName;
    map["Email"] = email;
    map["BirthDate"] = birthDate;
    map["ProfilePhoto"] = profilePhoto;
    map["FriendIds"] = friendIds;
    return map;
  }

}