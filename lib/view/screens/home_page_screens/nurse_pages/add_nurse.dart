import 'package:e_nurse_jobs/view/widget/auth_nav_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../logic/controllers/nurse_controller.dart';
import '../../../../routes/routes.dart';
import '../../../../utils.dart/app_colors.dart';
import '../../../../utils.dart/const_and_func.dart';
import '../../../widget/auth_text_field.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/circle_indecator_widget.dart';
import '../../../widget/text_widget.dart';

class AddNursePage extends StatelessWidget {
  AddNursePage({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameKey = TextEditingController();
  final TextEditingController phoneKey = TextEditingController();
  final NurseController nurseController = Get.find<NurseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<NurseController>(builder: (_) {
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
          ///////////
          nurseController.isCircleShown
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
              height: getHeightInPercent(context, 2),
            ),
            ///////////////////////
            AuthTextField(
                textInputType: TextInputType.number,
                isPrefix: true,
                controller: phoneKey,
                hintText: 'Enter Phone Number',
                labelText: 'Phone Number',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Phone Number should not be empty';
                  }
                },
                prefixIcon: const Icon(Icons.phone_enabled_outlined)),
            ////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 3),
            ),
            ///////////////////////
            AuthNavButtonWidget(
                isColoredLogin: nurseController.isMale,
                isColoredSignup: !nurseController.isMale,
                text1: 'Male',
                text2: 'FeMale',
                width: getWidthInPercent(context, 100),
                onTapLogin: () {
                  nurseController.changeIsMale(true);
                },
                onTapSignup: () {
                  nurseController.changeIsMale(false);
                }),
            ////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 3),
            ),
            ///////////////////////
            AuthNavButtonWidget(
                isColoredLogin: nurseController.isResigned,
                isColoredSignup: !nurseController.isResigned,
                text1: 'Resigned',
                text2: 'Not Resigned',
                width: getWidthInPercent(context, 100),
                onTapLogin: () {
                  nurseController.changeisResigned(true);
                },
                onTapSignup: () {
                  nurseController.changeisResigned(false);
                }),
            ////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 8),
            ),
            ///////////////////////
            ButtonWidget(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await nurseController.addNurse(
                        token: token,
                        name: nameKey.text,
                        phone: phoneKey.text,
                        gender: nurseController.isMale,
                        isResigned: nurseController.isResigned);
                  }
                },
                text: TextWidget(
                    text: 'ADD Nurse',
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
