import 'package:e_nurse_jobs/utils.dart/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onTap;
  final Widget text;
  final double width;
  final double height;

  const ButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            gradient: LinearGradient(colors: [
              AppColors.gradColor1,
              AppColors.gradColor2,
            ]),
          ),
          child: Center(child: text)),
    );
  }
}
