import 'package:e_nurse_jobs/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../../utils.dart/app_colors.dart';
import '../../utils.dart/const_and_func.dart';

class AuthNavButtonWidget extends StatelessWidget {
  final bool isColoredLogin;
  final bool isColoredSignup;
  final String text1, text2;
  final double width;
  final Function() onTapLogin;
  final Function() onTapSignup;
  const AuthNavButtonWidget({
    Key? key,
    required this.isColoredLogin,
    required this.isColoredSignup,
    required this.onTapLogin,
    required this.onTapSignup,
    this.text1 = 'LOGIN',
    this.text2 = 'SIGN UP',
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: onTapLogin,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(0),
                    ),
                    color: isColoredLogin
                        ? AppColors.primaryDark
                        : AppColors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: AppColors.greyColor,
                          offset: Offset(0, 5),
                          blurRadius: 8,
                          spreadRadius: 1)
                    ],
                  ),
                  child: Center(
                      child: TextWidget(
                          text: text1,
                          color: isColoredLogin
                              ? AppColors.white
                              : AppColors.primaryDark,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.center,
                          maxline: 1))),
            ),
          ),
          //////////
          Expanded(
            child: InkWell(
              onTap: onTapSignup,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(100),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(100),
                    ),
                    color: isColoredSignup
                        ? AppColors.primaryDark
                        : AppColors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: AppColors.greyColor,
                          offset: Offset(0, 5),
                          blurRadius: 8,
                          spreadRadius: 1)
                    ],
                  ),
                  child: Center(
                      child: TextWidget(
                          text: text2,
                          color: isColoredSignup
                              ? AppColors.white
                              : AppColors.primaryDark,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.center,
                          maxline: 1))),
            ),
          ),
        ],
      ),
    );
  }
}
