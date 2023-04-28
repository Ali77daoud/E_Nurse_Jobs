import 'package:e_nurse_jobs/routes/routes.dart';
import 'package:e_nurse_jobs/utils.dart/app_colors.dart';
import 'package:e_nurse_jobs/utils.dart/const_and_func.dart';
import 'package:e_nurse_jobs/view/widget/circle_indecator_widget.dart';
import 'package:e_nurse_jobs/view/widget/no_connection_widget.dart';
import 'package:e_nurse_jobs/view/widget/safe_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../logic/controllers/caring_controller.dart';
import '../../../widget/text_widget.dart';

class CaringPage extends StatelessWidget {
  CaringPage({super.key});
  final CaringController caringController = Get.find<CaringController>();

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(child: Scaffold(
      body: GetBuilder<CaringController>(builder: (_) {
        return caringController.isCircleShown
            ? const CircleIndicatorWidget(
                isWhite: true,
              )
            : caringController.isNoInternetConnection
                ? NoConnectionWidget(onTap: () async {
                    await caringController.getCaringData(token: token);
                  })
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildHeader(),
                        ////////////////////
                        SizedBox(
                          height: getHeightInPercent(context, 5),
                        ),
                        ////////////////
                        buildAddButton(context, caringController),
                        ////////////////
                        SizedBox(
                          height: getHeightInPercent(context, 3),
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
      width: 180,
      height: 180,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/logo.png',
              ),
              fit: BoxFit.contain)),
    );
  }

  Widget buildAddButton(
      BuildContext context, CaringController caringController) {
    return InkWell(
      onTap: () async {
        Get.toNamed(
          Routes.addCaringPage,
        );
        await caringController.getNurseData(token: token).then((value) async {
          caringController.nurseNames.addAll(caringController.nurseData!.obj
              .map((e) => '${e.id} ${e.name}')
              .toList());
          await caringController
              .getPatientData(token: token)
              .then((value) async {
            caringController.patientNames.addAll(caringController
                .patientData!.obj
                .map((e) => '${e.id} ${e.name}')
                .toList());

            await caringController
                .getCaringTypeData(token: token)
                .then((value) {
              caringController.caringTypeNames.addAll(caringController
                  .caringTypeData!.obj
                  .map((e) => '${e.id} ${e.name}')
                  .toList());
            });
          });
        });
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          itemCount: caringController.caringData!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Container(
                width: double.infinity,
                height: 90,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: caringController
                                    .caringData![index].nurses.name,
                                color: AppColors.primaryDark,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxline: 1),
                            /////////////
                            ////////////////////
                            SizedBox(
                              height: getHeightInPercent(context, 1),
                            ),
                            ////////////////
                            Expanded(
                              child: TextWidget(
                                  text: caringController
                                      .caringData![index].description,
                                  color: AppColors.greyColor,
                                  fontSize: 12,
                                  minFontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxline: 5),
                            ),
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
                              onPressed: () async {
                                Get.toNamed(Routes.editCaringPage, arguments: [
                                  caringController.caringData![index].id
                                ]);
                                /////////
                                await caringController
                                    .getNurseData(token: token)
                                    .then((value) async {
                                  caringController.nurseNames.addAll(
                                      caringController.nurseData!.obj
                                          .map((e) => '${e.id} ${e.name}')
                                          .toList());
                                  await caringController
                                      .getPatientData(token: token)
                                      .then((value) async {
                                    caringController.patientNames.addAll(
                                        caringController.patientData!.obj
                                            .map((e) => '${e.id} ${e.name}')
                                            .toList());

                                    await caringController
                                        .getCaringTypeData(token: token)
                                        .then((value) {
                                      caringController.caringTypeNames.addAll(
                                          caringController.caringTypeData!.obj
                                              .map((e) => '${e.id} ${e.name}')
                                              .toList());
                                    });
                                  });
                                });
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
                          Get.toNamed(Routes.detailsCaringPage);
                          await caringController.getDetailsCaringData(
                              token: token,
                              id: caringController.caringData![index].id);
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
      ),
    );
  }
}
