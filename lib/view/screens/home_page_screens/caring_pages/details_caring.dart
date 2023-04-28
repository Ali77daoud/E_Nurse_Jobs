import 'package:e_nurse_jobs/view/widget/safe_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../logic/controllers/caring_controller.dart';
import '../../../../utils.dart/const_and_func.dart';
import '../../../widget/circle_indecator_widget.dart';
import '../../../widget/details_widget.dart';
import '../../../widget/no_connection_widget.dart';

class DetailsCaringPage extends StatelessWidget {
  DetailsCaringPage({super.key});
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
                ? NoConnectionWidget(onTap: () async {})
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 180,
                            height: 180,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/logo.png',
                                    ),
                                    fit: BoxFit.contain)),
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 8),
                          ),
                          ////////////////
                          const DetailsWidget(
                            text1: 'Nurse Name',
                            text2: 'Sara Sara',
                            // caringController
                            //     .caringDetailsData!.obj.description,
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 2),
                          ),
                          ////////////////
                          const DetailsWidget(
                            text1: 'Patient Name',
                            text2: 'Ali Da',
                            // caringController
                            //     .caringDetailsData!.obj.description,
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 2),
                          ),
                          ////////////////
                          const DetailsWidget(
                            text1: 'Caring Type',
                            text2: 'Giving Injection',
                            // caringController
                            //     .caringDetailsData!.obj.description,
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 2),
                          ),
                          ////////////////
                          DetailsWidget(
                            text1: 'Time',
                            text2: caringController.caringDetailsData!.obj.time
                                .toString(),
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 2),
                          ),
                          ////////////////
                          ////////////////
                          DetailsWidget(
                            height: 100,
                            text1: 'Description',
                            text2: caringController
                                .caringDetailsData!.obj.description,
                          ),
                          ////////////////
                        ],
                      ),
                    ),
                  );
      }),
    ));
  }
}
