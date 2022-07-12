class UserModel {
  late String name;
  late String phone;
  late String email;
  late String id;
  late String authId;
  late int status;
  late int role;
  late List<dynamic> followers;
  late String dateAdded;
  late String address;
  late String profileImage;

  ////
  UserModel.fromJson(dynamic info) {
    name = info["name"];
    phone = info["phone"];
    email = info["email"];
    id = info["_id"];
    authId = info["authId"];
    status =info["status"];
    role = info["role"];
    followers = info["followers"] as List<dynamic>;
    dateAdded = info["dateAdded"];
    profileImage = info["profileImage"];
    address = info["address"];
  }
}
