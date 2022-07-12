import 'package:get/get.dart';
import 'package:tej_tech/api/post_routes.dart';
import 'package:tej_tech/app/model/user_model.dart';
import 'package:tej_tech/controller/index.dart';
import 'package:tej_tech/data/data.dart';
import 'package:tej_tech/params/new_user_info.dart';
import 'package:tej_tech/utilities/format_user_info.dart';

class AuthController extends GetxController {
  Controller controller = Controller();
  bool loggedIn = false;
   UserModel user=UserModel.fromJson(Data.initialuser);
  NewUserInfo info = NewUserInfo();
  String? error;
  String? message;

  ////
  void handleRegister() async {
    error = null;
    message = null;
    update();
    Response response =
        await controller.handlePost(PostRoutes.register, formatUserInfo(info));
    if (response.statusCode == 200 || response.statusCode == 201) {
      message = response.body.toString();
      update();
    } else {
      error = response.body.toString();
      update();
    }
  }

  void handleLogin() async {
    try{
      error = null;
    message = null;
    update();
    Response response =
        await controller.handlePost(PostRoutes.login, formatLoginInfo(info));
    if (response.statusCode == 200 || response.statusCode == 201) {
      user = UserModel.fromJson(response.body);
      loggedIn = true;
      print(response.body);
      update();
    } else {
      error = response.body.toString();
      update();
    }
    }catch(err){
      error = err.toString();
      update();
    }
  }
}
