import 'package:e_nurse_jobs/utils.dart/app_colors.dart';
import 'package:flutter/material.dart';

class CircleIndicatorWidget extends StatelessWidget {
  final bool isWhite;
  const CircleIndicatorWidget({Key? key, this.isWhite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: isWhite ? AppColors.white : Colors.black.withOpacity(0.3),
        ),
        const CircularProgressIndicator(
          color: AppColors.primaryDark,
        )
      ],
    );
  }
}
