import 'package:e_nurse_jobs/routes/routes.dart';
import 'package:e_nurse_jobs/utils.dart/const_and_func.dart';
import 'package:e_nurse_jobs/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/auth_controller.dart';
import '../../../utils.dart/app_colors.dart';
import '../../widget/safe_area_widget.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryDark,
          title: Image.asset(
            'assets/images/logo.png',
            width: 40,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  authController.logOut();
                },
                icon: const Icon(
                  Icons.logout,
                  color: AppColors.white,
                ))
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bg2.png',
                        ),
                        fit: BoxFit.cover))),
            ///////////////
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 10, right: 10, left: 10),
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return homePageFunc(index);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget homePageFunc(int index) {
    return InkWell(
      onTap: () {
        if (index == 0) {
          Get.toNamed(Routes.nursePage);
        }
        if (index == 1) {
          Get.toNamed(Routes.patientPage);
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryDark),
            image: DecorationImage(
                image: AssetImage(
                  homePageImg[index],
                ),
                fit: BoxFit.contain)),
        child: TextWidget(
            text: homePageTitles[index],
            color: AppColors.primaryDark,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            maxline: 3),
      ),
    );
  }
}
