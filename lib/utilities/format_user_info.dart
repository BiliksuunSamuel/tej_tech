import 'package:tej_tech/params/new_user_info.dart';

Map<String, dynamic> formatUserInfo(NewUserInfo info) {
  return {
    "name": info.name,
    "phone": info.phone,
    "email": info.email,
    "password": info.password
  };
}

Map<String, dynamic> formatLoginInfo(NewUserInfo info) {
  return {
    "email": info.email,
    "password": info.password,
  };
}
