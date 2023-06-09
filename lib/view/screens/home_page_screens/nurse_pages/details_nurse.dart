import 'package:e_nurse_jobs/view/widget/safe_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../logic/controllers/nurse_controller.dart';
import '../../../../utils.dart/const_and_func.dart';
import '../../../widget/circle_indecator_widget.dart';
import '../../../widget/details_widget.dart';
import '../../../widget/no_connection_widget.dart';

class DetailsNursePge extends StatelessWidget {
  DetailsNursePge({super.key});
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
                ? NoConnectionWidget(onTap: () async {})
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/nurse.png',
                                    ),
                                    fit: BoxFit.contain)),
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 3),
                          ),
                          ////////////////
                          DetailsWidget(
                            text1: 'Name',
                            text2: nurseController.nurseDetailsData!.name,
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 3),
                          ),
                          ////////////////
                          DetailsWidget(
                            text1: 'Phone Number',
                            text2: nurseController.nurseDetailsData!.phone,
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 3),
                          ),
                          ////////////////
                          DetailsWidget(
                            text1: 'Gender',
                            text2: nurseController.nurseDetailsData!.gender
                                ? 'Male'
                                : 'FeMale',
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 3),
                          ),
                          ////////////////
                          DetailsWidget(
                            text1: 'Is Resigned',
                            text2: nurseController.nurseDetailsData!.isResigned
                                ? 'Resigned'
                                : 'Not Resigned',
                          ),
                        ],
                      ),
                    ),
                  );
      }),
    ));
  }
}
