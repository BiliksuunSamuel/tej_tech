import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/custom_button.dart';
import 'package:tej_tech/components/response_label.dart';
import 'package:tej_tech/components/small_text.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/controller/auth_controller.dart';
import 'package:tej_tech/screens/auth/welcome_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthController());
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.primaryColor,
              pinned: true,
              title: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(Dimensions.getheight(10)),
                  child: Center(
                    child: BigText(
                      text: "Register With Us!",
                      bold: true,
                      textColor: Colors.black,
                    ),
                  )),
              automaticallyImplyLeading: false,
              expandedHeight: Dimensions.getheight(200),
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                "assets/shop.jpg",
                fit: BoxFit.cover,
              )),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(Dimensions.getheight(40)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.getwidth(20),
                        vertical: Dimensions.getheight(10)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.getheight(15)),
                          topRight: Radius.circular(Dimensions.getheight(15)),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "TejTech",
                          bold: true,
                          fontSize: Dimensions.getheight(24),
                        ),
                        SmallText(text: "SignUp")
                      ],
                    ),
                  )),
            ),
            SliverFillRemaining(
              child: Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(Dimensions.getheight(20)),
                  child: Column(children: [
                    TextField(
                      onChanged: (text) {
                        authController.info.name = text;
                      },
                      decoration: const InputDecoration(
                          labelText: "Full Name",
                          hintText: "Enter Full Name",
                          icon: Icon(Icons.person_outline)),
                    ),
                    SizedBox(
                      height: Dimensions.getheight(5),
                    ),
                    TextField(
                      onChanged: (text) {
                        authController.info.phone = text;
                      },
                      decoration: const InputDecoration(
                          labelText: "Phone Number",
                          hintText: "Enter Phone Number",
                          icon: Icon(Icons.phone_outlined)),
                    ),
                    SizedBox(
                      height: Dimensions.getheight(5),
                    ),
                    TextField(
                      onChanged: (text) {
                        authController.info.email = text;
                      },
                      decoration: const InputDecoration(
                          labelText: "Email Address",
                          hintText: "Enter Email Address",
                          icon: Icon(Icons.email_outlined)),
                    ),
                    SizedBox(
                      height: Dimensions.getheight(5),
                    ),
                    TextField(
                      onChanged: (text) {
                        authController.info.password = text;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Password",
                          icon: Icon(Icons.key_outlined)),
                    ),
                    SizedBox(
                      height: Dimensions.getheight(10),
                    ),
                    CustomButton( handleClick: ()=>authController.handleRegister(),),
                    SizedBox(
                      height: Dimensions.getheight(10),
                    ),
                    Container(
                      height: Dimensions.getheight(40),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: Dimensions.getwidth(0.5),
                            color: const Color.fromARGB(255, 214, 80, 138)),
                        borderRadius:
                            BorderRadius.circular(Dimensions.getwidth(8)),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.alternate_email,
                              size: Dimensions.getheight(14),
                              color: AppColors.primaryColor,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Sign Up With Gmail",
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: Dimensions.getheight(15)),
                                ))
                          ]),
                    ),
                    SizedBox(
                      height: Dimensions.getheight(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BigText(
                          text: "already Registered?",
                          fontSize: Dimensions.getheight(15),
                          textColor: Colors.black87,
                        ),
                        TextButton(
                            onPressed: () => Get.to(() => const WelcomeScreen(),
                                transition: Transition.fadeIn),
                            child: BigText(
                              text: "Login",
                              textColor: AppColors.primaryColor,
                              fontSize: Dimensions.getheight(16),
                              bold: true,
                            )),

                       
                      ],
                    ),
                     SizedBox(height: Dimensions.getheight(10),),
                   authController.error!=null?ResponseLabel(isError: true,error: authController.error,):Container(),
                   authController.message!=null?ResponseLabel(isSuccess: true,message: authController.message,):Container()
                  ]),
                ),
              )),
            ),
          ],
        ),
      );
    });
  }
}
