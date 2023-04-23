import 'package:e_nurse_jobs/logic/controllers/nurse_controller.dart';
import 'package:e_nurse_jobs/routes/routes.dart';
import 'package:e_nurse_jobs/utils.dart/app_colors.dart';
import 'package:e_nurse_jobs/utils.dart/const_and_func.dart';
import 'package:e_nurse_jobs/view/widget/circle_indecator_widget.dart';
import 'package:e_nurse_jobs/view/widget/no_connection_widget.dart';
import 'package:e_nurse_jobs/view/widget/safe_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/text_widget.dart';

class NursePage extends StatelessWidget {
  NursePage({super.key});
  final NurseController nurseController = Get.find<NurseController>();

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(child: Scaffold(
      body: GetBuilder<NurseController>(builder: (_) {
        return nurseController.isCircleShown
            ? const CircleIndicatorWidget(
                isWhite: true,
              )
            : nurseController.isNoInternetConnection
                ? NoConnectionWidget(onTap: () async {
                    await nurseController.getNurseData(token: token);
                  })
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildHeader(),
                        ////////////////////
                        SizedBox(
                          height: getHeightInPercent(context, 3),
                        ),
                        ////////////////
                        buildAddButton(context),
                        ////////////////
                        SizedBox(
                          height: getHeightInPercent(context, 2),
                        ),
                        ////////////////
                        buildBody()
                      ],
                    ),
                  );
      }),
    ));
  }

  Widget buildHeader() {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/nurse.png',
              ),
              fit: BoxFit.contain)),
    );
  }

  Widget buildAddButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.addNursePage);
      },
      child: Container(
        color: AppColors.primaryDark,
        width: getWidthInPercent(context, 40),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
                text: 'Add',
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                maxline: 2),
            /////////////
            const Icon(
              Icons.add,
              color: AppColors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return Expanded(
      child: ListView.builder(
        itemCount: nurseController.nurseData!.obj.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: const BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.lightGray,
                      offset: Offset(0, 4),
                      blurRadius: 2,
                      spreadRadius: 1)
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: getHeightInPercent(context, 100),
                    width: getWidthInPercent(context, 10),
                    color: AppColors.primaryDark,
                    child: Center(
                      child: TextWidget(
                          text: '# ${index + 1}',
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          maxline: 2),
                    ),
                  ),
                  ////////////////////
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              text: nurseController.nurseData!.obj[index].name,
                              color: AppColors.primaryDark,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                              maxline: 2),
                          /////////////
                          TextWidget(
                              text: nurseController.nurseData!.obj[index].phone,
                              color: AppColors.greyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.start,
                              maxline: 2),
                          /////////////
                          TextWidget(
                              text: nurseController.nurseData!.obj[index].gender
                                  ? 'Male'
                                  : 'FeMale',
                              color: AppColors.greyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.start,
                              maxline: 2),
                          /////////////
                          TextWidget(
                              text: nurseController
                                      .nurseData!.obj[index].isResigned
                                  ? 'Resigned'
                                  : 'Not Resigned',
                              color: AppColors.greyColor,
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.start,
                              maxline: 2),
                        ],
                      ),
                    ),
                  ),
                  ////////////////////
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 22,
                            )),
                        IconButton(
                            onPressed: () {
                              Get.toNamed(Routes.editNursePage);
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 22,
                              color: AppColors.secondary,
                            )),
                      ],
                    ),
                  ),
                  ////////////////////
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.detailsNursePage);
                      },
                      child: Container(
                        height: getHeightInPercent(context, 100),
                        color: AppColors.primaryDark,
                        child: Center(
                          child: TextWidget(
                              text: 'Details',
                              color: AppColors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                              maxline: 2),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
