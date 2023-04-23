import 'package:e_nurse_jobs/logic/controllers/auth_controller.dart';
import 'package:e_nurse_jobs/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils.dart/app_colors.dart';
import '../../../utils.dart/const_and_func.dart';
import '../../widget/auth_nav_button_widget.dart';
import '../../widget/auth_text_field.dart';
import '../../widget/button_widget.dart';
import '../../widget/circle_indecator_widget.dart';
import '../../widget/safe_area_widget.dart';
import '../../widget/text_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameKey = TextEditingController();
  final TextEditingController emailKey = TextEditingController();
  final TextEditingController passKey = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(child: GetBuilder<AuthController>(builder: (_) {
      return Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headerSection(context),
                  ///////////////////////
                  SizedBox(
                    height: getHeightInPercent(context, 4),
                  ),
                  //////////////////////

                  bodySection(context),
                ],
              ),
            ),
            ///////////
            authController.isCircleShown
                ? const CircleIndicatorWidget()
                : Container()
          ],
        ),
      );
    }));
  }

  Widget headerSection(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getHeightInPercent(context, 33),
      child: Stack(
        children: [
          Container(
              height: getHeightInPercent(context, 30),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/auth_pg.png',
                      ),
                      fit: BoxFit.cover))),
          ////////////////////////
          Align(
            alignment: Alignment.bottomCenter,
            child: AuthNavButtonWidget(
              isColoredLogin: false,
              isColoredSignup: true,
              width: getWidthInPercent(context, 60),
              onTapLogin: () {
                Get.offNamed(Routes.loginScreen);
              },
              onTapSignup: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget bodySection(BuildContext context) {
    return Column(
      children: [
        TextWidget(
            text: 'SignUp to your Account',
            color: AppColors.primaryDark,
            fontSize: 17,
            fontWeight: FontWeight.normal,
            textAlign: TextAlign.center,
            maxline: 1),
        ///////////////////////
        SizedBox(
          height: getHeightInPercent(context, 7),
        ),
        //////////////////////
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getWidthInPercent(context, 10)),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthTextField(
                  textInputType: TextInputType.text,
                  isPrefix: true,
                  controller: userNameKey,
                  hintText: 'Enter  UserName',
                  labelText: 'UserName',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'UserName should not be empty';
                    }
                  },
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                //////////////////
                SizedBox(
                  height: getHeightInPercent(context, 3),
                ),
                /////////////////
                AuthTextField(
                    textInputType: TextInputType.text,
                    isPrefix: true,
                    controller: emailKey,
                    hintText: 'Enter email',
                    labelText: 'Email',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email Number should not be empty';
                      } else if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Enter valid email';
                      }
                    },
                    prefixIcon: const Icon(Icons.email_outlined)),
                //////////////////
                SizedBox(
                  height: getHeightInPercent(context, 3),
                ),
                ////////////
                AuthTextField(
                    textInputType: TextInputType.visiblePassword,
                    isPrefix: true,
                    controller: passKey,
                    hintText: 'Enter  Password',
                    labelText: 'Password',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password should not be empty';
                      } else if (value!.length < 8) {
                        return 'Password should not be less than 8 characters';
                      } else if (!RegExp(validationPassword).hasMatch(value)) {
                        return 'Password must contain capital and small latters , numbers and symbols';
                      }
                    },
                    prefixIcon: const Icon(Icons.lock_outline)),
                //////////////r

                SizedBox(
                  height: getHeightInPercent(context, 7),
                ),
                ////////////
                ButtonWidget(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await authController
                            .register(
                                userName: userNameKey.text,
                                email: emailKey.text,
                                password: passKey.text)
                            .then((value) async {
                          await authController.logIn(
                              userName: userNameKey.text,
                              password: passKey.text);
                        });
                      }
                    },
                    text: TextWidget(
                        text: 'SIGN UP',
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        maxline: 1),
                    width: double.infinity,
                    height: 45),
                ///////
                SizedBox(
                  height: getHeightInPercent(context, 3),
                ),
                ////////////
                Container(
                  height: 1,
                  width: getWidthInPercent(context, 80),
                  color: AppColors.lightGray,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
