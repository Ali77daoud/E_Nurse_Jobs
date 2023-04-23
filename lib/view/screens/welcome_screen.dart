import 'package:e_nurse_jobs/routes/routes.dart';
import 'package:e_nurse_jobs/utils.dart/app_colors.dart';
import 'package:e_nurse_jobs/utils.dart/const_and_func.dart';
import 'package:e_nurse_jobs/view/widget/button_widget.dart';
import 'package:e_nurse_jobs/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/safe_area_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bg1.png',
                        ),
                        fit: BoxFit.cover))),
            ///////////////
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidthInPercent(context, 10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/logo.png',
                              ),
                              fit: BoxFit.contain))),
                  SizedBox(
                    height: getHeightInPercent(context, 5),
                  ),
                  ///////////////////////
                  TextWidget(
                      text: 'Ensure to keep track of',
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.center,
                      maxline: 1),
                  //////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                          text: 'Your ',
                          color: AppColors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          maxline: 1),
                      //////////////
                      TextWidget(
                          text: 'Patient',
                          color: AppColors.secondary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          maxline: 1),
                      //////////////
                    ],
                  ),
                  //////////////////
                  SizedBox(
                    height: getHeightInPercent(context, 25),
                  ),
                  ///////////////////////
                  ButtonWidget(
                      onTap: () {
                        Get.toNamed(Routes.loginScreen);
                      },
                      text: TextWidget(
                          text: 'Get Started',
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          maxline: 1),
                      width: double.infinity,
                      height: 55)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
