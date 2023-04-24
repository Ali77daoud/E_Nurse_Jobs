import 'package:e_nurse_jobs/view/widget/safe_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../logic/controllers/caring_type_controller.dart';
import '../../../../utils.dart/const_and_func.dart';
import '../../../widget/circle_indecator_widget.dart';
import '../../../widget/details_widget.dart';
import '../../../widget/no_connection_widget.dart';

class DetailsCaringTypePage extends StatelessWidget {
  DetailsCaringTypePage({super.key});
  final CaringTypeController caringTypeController =
      Get.find<CaringTypeController>();

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(child: Scaffold(
      body: GetBuilder<CaringTypeController>(builder: (_) {
        return caringTypeController.isCircleShown
            ? const CircleIndicatorWidget(
                isWhite: true,
              )
            : caringTypeController.isNoInternetConnection
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
                                      'assets/images/caring_type.png',
                                    ),
                                    fit: BoxFit.contain)),
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 15),
                          ),
                          ////////////////
                          DetailsWidget(
                            text1: 'Name',
                            text2: caringTypeController
                                .caringTypeDetailsData!.name,
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 3),
                          ),
                          ////////////////
                          DetailsWidget(
                            height: 100,
                            text1: 'Description',
                            text2: caringTypeController
                                .caringTypeDetailsData!.description,
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
