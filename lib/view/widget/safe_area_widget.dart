import 'package:e_nurse_jobs/utils.dart/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils.dart/const_and_func.dart';

class SafeAreaWidget extends StatelessWidget {
  final Widget child;
  const SafeAreaWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryDark,
      child: SafeArea(
        child: Center(
               child: child,
             ),
      ),
    );
  }
}
