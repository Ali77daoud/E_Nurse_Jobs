import 'package:e_nurse_jobs/routes/routes.dart';
import 'package:e_nurse_jobs/view/widget/auth_nav_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../logic/controllers/patient_controller.dart';
import '../../../../utils.dart/app_colors.dart';
import '../../../../utils.dart/const_and_func.dart';
import '../../../widget/auth_text_field.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/circle_indecator_widget.dart';
import '../../../widget/text_widget.dart';

class EditPatientPage extends StatelessWidget {
  EditPatientPage({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameKey = TextEditingController();
  final PatientController patientContrpoller = Get.find<PatientController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<PatientController>(builder: (_) {
      return Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildHeader(),
                      ////////////////////////
                      SizedBox(
                        height: getHeightInPercent(context, 4),
                      ),
                      ///////////////////////
                      buildBody(context)
                    ]),
              )),
          //////////////////
          ///////////
          patientContrpoller.isCircleShown
              ? const CircleIndicatorWidget()
              : Container()
        ],
      );
    }));
  }

  Widget buildBody(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthTextField(
                textInputType: TextInputType.text,
                isPrefix: true,
                controller: nameKey,
                hintText: 'Enter Name',
                labelText: 'Name',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Name should not be empty';
                  }
                },
                prefixIcon: const Icon(Icons.person_outline)),
            ////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 3),
            ),

            GetBuilder<PatientController>(builder: (_) {
              return AuthNavButtonWidget(
                  isColoredLogin: patientContrpoller.isStopped,
                  isColoredSignup: !patientContrpoller.isStopped,
                  text1: 'Stopped',
                  text2: 'Not Stopped',
                  width: getWidthInPercent(context, 100),
                  onTapLogin: () {
                    patientContrpoller.changeisStopped(true);
                  },
                  onTapSignup: () {
                    patientContrpoller.changeisStopped(false);
                  });
            }),

            ////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 8),
            ),
            ///////////////////////
            ButtonWidget(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    // await patientContrpoller.editNurseData(
                    //     token: token,
                    //     name: nameKey.text,
                    //     phone: phoneKey.text,
                    //     id: Get.arguments[0],
                    //     gender: patientContrpoller.isMale,
                    //     isResigned: patientContrpoller.isResigned);
                  }
                },
                text: TextWidget(
                    text: 'Edit Nurse',
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    maxline: 1),
                width: double.infinity,
                height: 40),

            ////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 5),
            ),
            ///////////////////////
          ],
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
}
