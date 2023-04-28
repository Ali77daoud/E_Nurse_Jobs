import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../logic/controllers/caring_type_controller.dart';
import '../../../../utils.dart/app_colors.dart';
import '../../../../utils.dart/const_and_func.dart';
import '../../../widget/auth_text_field.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/circle_indecator_widget.dart';
import '../../../widget/text_widget.dart';

class EditCaringTypePage extends StatelessWidget {
  EditCaringTypePage({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameKey = TextEditingController();
  final TextEditingController descriptionKey = TextEditingController();
  final CaringTypeController caringTypeController =
      Get.find<CaringTypeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<CaringTypeController>(builder: (_) {
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
                        height: getHeightInPercent(context, 10),
                      ),
                      ///////////////////////
                      buildBody(context)
                    ]),
              )),
          //////////////////
          ///////////
          caringTypeController.isCircleShown
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
              height: getHeightInPercent(context, 4),
            ),
            ///////////////////////
            AuthTextField(
                textInputType: TextInputType.number,
                isPrefix: true,
                controller: descriptionKey,
                maxLines: 6,
                hintText: 'Enter Description',
                labelText: 'Description',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Description should not be empty';
                  }
                },
                prefixIcon: const Icon(Icons.description)),
            ////////////////////////

            ////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 5),
            ),

            ///////////////////////
            ButtonWidget(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await caringTypeController.editCaringTypeData(
                      token: token,
                      name: nameKey.text,
                      description: descriptionKey.text,
                      id: Get.arguments[0],
                    );
                  }
                },
                text: TextWidget(
                    text: 'Edit CaringType',
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
      width: 180,
      height: 180,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/caring_type.jpg',
              ),
              fit: BoxFit.contain)),
    );
  }
}
