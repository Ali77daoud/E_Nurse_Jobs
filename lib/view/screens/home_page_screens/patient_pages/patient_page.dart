import 'package:e_nurse_jobs/routes/routes.dart';
import 'package:e_nurse_jobs/utils.dart/app_colors.dart';
import 'package:e_nurse_jobs/utils.dart/const_and_func.dart';
import 'package:e_nurse_jobs/view/widget/circle_indecator_widget.dart';
import 'package:e_nurse_jobs/view/widget/no_connection_widget.dart';
import 'package:e_nurse_jobs/view/widget/safe_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../logic/controllers/patient_controller.dart';
import '../../../widget/text_widget.dart';

class PatientPage extends StatelessWidget {
  PatientPage({super.key});
  final PatientController patientController = Get.find<PatientController>();

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(child: Scaffold(
      body: GetBuilder<PatientController>(builder: (_) {
        return patientController.isCircleShown
            ? const CircleIndicatorWidget(
                isWhite: true,
              )
            : patientController.isNoInternetConnection
                ? NoConnectionWidget(onTap: () async {
                    await patientController.getPatientData(token: token);
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
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/patient.jpg',
              ),
              fit: BoxFit.contain)),
    );
  }

  Widget buildAddButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.addPatientPage,
        );
      },
      child: Container(
        color: AppColors.primaryDark,
        width: getWidthInPercent(context, 30),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
                text: 'Add',
                color: AppColors.white,
                fontSize: 13,
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
        itemCount: patientController.patientData!.obj.length,
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
                              text: patientController
                                  .patientData!.obj[index].name,
                              color: AppColors.primaryDark,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                              maxline: 2),

                          /////////////
                          TextWidget(
                              text: patientController
                                      .patientData!.obj[index].isStoped
                                  ? 'Stopped'
                                  : 'Not Stopped',
                              color: AppColors.greyColor,
                              fontSize: 11,
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
                              Get.toNamed(Routes.editPatientPage, arguments: [
                                patientController.patientData!.obj[index].id
                              ]);
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
                      onTap: () async {
                        Get.toNamed(Routes.detailsPatientPage);
                        await patientController.getDetailsPatientData(
                            token: token,
                            id: patientController.patientData!.obj[index].id);
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
