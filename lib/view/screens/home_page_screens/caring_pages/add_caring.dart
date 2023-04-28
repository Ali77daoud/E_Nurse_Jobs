import 'package:e_nurse_jobs/view/widget/custom_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../logic/controllers/caring_controller.dart';
import '../../../../utils.dart/app_colors.dart';
import '../../../../utils.dart/const_and_func.dart';
import '../../../widget/auth_text_field.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/circle_indecator_widget.dart';
import '../../../widget/no_connection_widget.dart';
import '../../../widget/text_widget.dart';

class AddCaringPage extends StatelessWidget {
  AddCaringPage({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameKey = TextEditingController();
  final TextEditingController descriptionKey = TextEditingController();
  final CaringController caringController = Get.find<CaringController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<CaringController>(builder: (_) {
      return caringController.isCircleShown
          ? const CircleIndicatorWidget(
              isWhite: true,
            )
          : caringController.isNoInternetConnection
              ? NoConnectionWidget(onTap: () async {
                  // await caringController.getCaringData(token: token);
                })
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildHeader(),
                          ////////////////////////
                          SizedBox(
                            height: getHeightInPercent(context, 8),
                          ),
                          ///////////////////////
                          buildBody(context)
                        ]),
                  ));
    }));
  }

  Widget buildBody(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomDropDownWidget(
                hintText: 'Add',
                items: caringController.nurseNames,
                labelText: 'Nurse Name',
                onChange: (String? newValue) {
                  caringController.changenurseId(newValue!);
                  // caringController.nurseId = newValue!.split(' ')[0];
                  print(caringController.nurseId);
                },
                value: caringController.nurseId),
            ////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 2),
            ),
            ///////////////////////
            CustomDropDownWidget(
                hintText: 'Add',
                items: caringController.patientNames,
                labelText: 'Patient Name',
                onChange: (String? newValue) {
                  caringController.patientId = newValue!;
                  print(caringController.patientId);
                },
                value: caringController.patientId),
            ////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 2),
            ),
            ///////////////////////
            CustomDropDownWidget(
                hintText: 'Add',
                items: caringController.caringTypeNames,
                labelText: 'Caring Type',
                onChange: (String? newValue) {
                  caringController.caringTypeId = newValue!;
                  print(caringController.caringTypeId);
                },
                value: caringController.caringTypeId),
            ////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 3),
            ),
            ///////////////////////
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primaryDark, width: 2)),
              child: TextButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2022, 3, 5),
                        maxTime: DateTime(2023, 6, 7),
                        onChanged: (date) {}, onConfirm: (date) {
                      caringController.changeDate(date.toString());
                      print(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(
                          DateTime.parse(caringController.date.toString())));
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    caringController.date ?? 'show date time picker',
                    style: const TextStyle(color: Colors.blue),
                  )),
            ),
            ////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 3),
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
            SizedBox(
              height: getHeightInPercent(context, 8),
            ),
            ///////////////////////
            ButtonWidget(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await caringController.addCaring(
                        token: token,
                        nurseId:
                            int.parse(caringController.nurseId.split(' ')[0]),
                        patientId:
                            int.parse(caringController.patientId.split(' ')[0]),
                        caringTypeId: int.parse(
                            caringController.caringTypeId.split(' ')[0]),
                        time: DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(
                            DateTime.parse(caringController.date.toString())),
                        description: descriptionKey.text);
                  }
                },
                text: TextWidget(
                    text: 'ADD Caring',
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
                'assets/images/logo.png',
              ),
              fit: BoxFit.contain)),
    );
  }
}
