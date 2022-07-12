import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tej_tech/components/big_text.dart';
import 'package:tej_tech/components/custom_text_button.dart';
import 'package:tej_tech/components/drawer_link.dart';
import 'package:tej_tech/components/profile_avatar.dart';
import 'package:tej_tech/constants/app_colors.dart';
import 'package:tej_tech/constants/dimensions.dart';
import 'package:tej_tech/controller/auth_controller.dart';
import 'package:tej_tech/screens/auth/welcome_screen.dart';
import 'package:tej_tech/screens/store/categories_screen.dart';
import 'package:tej_tech/screens/store/product_store_screen.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthController());

    return GetBuilder<AuthController>(builder: (authController) {
      return  Container(
        padding: EdgeInsets.only(
            top: Dimensions.getheight(40),
            left: Dimensions.getwidth(10),
            right: Dimensions.getwidth(10)),
        width: Dimensions.getwidth(225),
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProfileAvatar(
                    width: Dimensions.getwidth(40),
                    height: Dimensions.getheight(40),
                  ),
                  SizedBox(
                    width: Dimensions.getwidth(10),
                  ),
                  authController.user.name.isNotEmpty?BigText(text: authController.user.name,fontSize: Dimensions.getheight(16),textColor: Colors.white,): CustomTextButton(
                      text: "SignUp/Login",
                      handlePress: () {
                        Get.to(() => const WelcomeScreen(),
                            transition: Transition.fadeIn);
                      })
                ],
              ),
              const Divider(
                color: Color.fromRGBO(211, 211, 211, 0.45),
              ),
              DrawerLink(
                icon: Icons.store_outlined,
                text: "Store",
                handlePress: () => Get.to(() => ProductStoreScreen(),
                    transition: Transition.fadeIn),
              ),
              DrawerLink(
                icon: Icons.shopping_basket_outlined,
                text: "Orders",
                handlePress: () {},
              ),
              DrawerLink(
                icon: Icons.favorite_outline_outlined,
                text: "WishList",
                handlePress: () {},
              ),
              DrawerLink(icon: Icons.read_more_outlined, text: "Product Categories", handlePress: ()=>Get.to(CategoriesScreen())),
              DrawerLink(
                icon: Icons.help_outline,
                text: "Help / Support",
                handlePress: () {},
              ),
            ]),
      );
    });
  }
}
