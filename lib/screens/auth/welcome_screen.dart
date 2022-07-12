import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/custom_button.dart';
import 'package:tej_tech/components/response_label.dart';
import 'package:tej_tech/components/small_text.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/controller/auth_controller.dart';
import 'package:tej_tech/screens/auth/register_screen.dart';
import 'package:tej_tech/screens/home/homepage.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

       Get.lazyPut(() => AuthController());
    return GetBuilder<AuthController>(builder: (authController) {
      if (authController.user.name.isNotEmpty) {
      }
      return Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.primaryColor,
              pinned: true,
              title: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                child: Text(
                  "Open For Business",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: Dimensions.getwidth(20)),
                ),
              ),
              automaticallyImplyLeading: false,
              expandedHeight: Dimensions.getheight(300),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/shop.jpg",
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(25),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.getheight(10),
                      horizontal: Dimensions.getwidth(25)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.getwidth(25)),
                        topRight: Radius.circular(Dimensions.getwidth(25)),
                      )),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: BigText(
                            text: "TejTech",
                            fontSize: Dimensions.getheight(24),
                            bold: true,
                          ),
                        ),
                        SmallText(text: "Login")
                      ]),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Expanded(
                  child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.getheight(20),
                        horizontal: Dimensions.getwidth(5)),
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.getheight(20)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: "Welcome Back!",
                              fontSize: Dimensions.getwidth(24),
                              bold: true,
                            ),
                            SizedBox(
                              height: Dimensions.getheight(15),
                            ),
                            TextField(
                              onChanged: (text) {
                                authController.info.email = text;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  hintText: "Email Address",
                                  labelText: "Email Address",
                                  icon: Icon(Icons.email_outlined)),
                            ),
                            SizedBox(
                              height: Dimensions.getheight(15),
                            ),
                            TextField(
                              onChanged: (text) {
                                authController.info.password = text;
                              },
                              maxLines: 1,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: "Password",
                                  labelText: "Password",
                                  icon: Icon(Icons.key_outlined)),
                            ),
                            SizedBox(
                              height: Dimensions.getheight(15),
                            ),
                            CustomButton(
                              handleClick: () => authController.handleLogin(),
                            ),
                            SizedBox(
                              height: Dimensions.getheight(5),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forgot Password",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: Dimensions.getheight(18)),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.getheight(10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                BigText(
                                  text: "don't have Account?",
                                  fontSize: Dimensions.getheight(15),
                                  textColor: Colors.black87,
                                ),
                                TextButton(
                                    onPressed: () => Get.to(
                                        () => const RegisterScreen(),
                                        transition: Transition.fadeIn),
                                    child: BigText(
                                      text: "Register",
                                      textColor: AppColors.primaryColor,
                                      fontSize: Dimensions.getheight(16),
                                      bold: true,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.getheight(10),
                            ),
                            authController.error != null
                                ? ResponseLabel(
                                    isError: true,
                                    error: authController.error,
                                  )
                                : Container(),
                            authController.message != null
                                ? ResponseLabel(
                                    isSuccess: true,
                                    message: authController.message,
                                  )
                                : Container()
                          ]),
                    )),
              )),
            )
          ],
        ),
      );
    });
  }
}
