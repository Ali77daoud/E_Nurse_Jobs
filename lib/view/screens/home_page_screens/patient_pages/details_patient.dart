import 'package:e_nurse_jobs/view/widget/safe_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../logic/controllers/patient_controller.dart';
import '../../../../utils.dart/const_and_func.dart';
import '../../../widget/circle_indecator_widget.dart';
import '../../../widget/details_widget.dart';
import '../../../widget/no_connection_widget.dart';

class DetailsPatientPage extends StatelessWidget {
  DetailsPatientPage({super.key});
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
                                      'assets/images/patient.png',
                                    ),
                                    fit: BoxFit.contain)),
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 7),
                          ),
                          ////////////////
                          DetailsWidget(
                            text1: 'Name',
                            text2: patientController.patientDetailsData!.name,
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 3),
                          ),
                          ////////////////
                          DetailsWidget(
                            text1: 'Is Stopped',
                            text2:
                                patientController.patientDetailsData!.isStoped
                                    ? 'Stopped'
                                    : 'Not Stoped',
                          ),
                          ////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 3),
                          ),
                          ////////////////
                          DetailsWidget(
                            text1: 'Room Photo',
                            text2:
                                patientController.patientDetailsData!.roomPhoto,
                            isImage: true,
                            height: 100,
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
