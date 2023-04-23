import 'package:e_nurse_jobs/view/widget/auth_nav_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils.dart/app_colors.dart';
import '../../../../utils.dart/const_and_func.dart';
import '../../../widget/auth_text_field.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/text_widget.dart';

class AddNursePage extends StatelessWidget {
  AddNursePage({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameKey = TextEditingController();
  final TextEditingController phoneKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                ////////////////////////
                SizedBox(
                  height: getHeightInPercent(context, 4),
                ),
                ///////////////////////
                Form(
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
                        isColoredLogin: true,
                        isColoredSignup: false,
                        text1: 'Male',
                        text2: 'FeMale',
                        width: getWidthInPercent(context, 100),
                        onTapLogin: () {},
                        onTapSignup: () {}),
                    ////////////////////////
                    SizedBox(
                      height: getHeightInPercent(context, 3),
                    ),
                    ///////////////////////
                    AuthNavButtonWidget(
                        isColoredLogin: true,
                        isColoredSignup: false,
                        text1: 'Resigned',
                        text2: 'Not Resigned',
                        width: getWidthInPercent(context, 100),
                        onTapLogin: () {},
                        onTapSignup: () {}),
                     ////////////////////////
                    SizedBox(
                      height: getHeightInPercent(context, 8),
                    ),
                    ///////////////////////
                    ButtonWidget(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {}
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
                ))
              ]),
            )));
  }
}
