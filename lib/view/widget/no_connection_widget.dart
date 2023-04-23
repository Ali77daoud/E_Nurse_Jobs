import 'package:e_nurse_jobs/view/widget/button_widget.dart';
import 'package:e_nurse_jobs/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../../utils.dart/app_colors.dart';
import '../../utils.dart/const_and_func.dart';

class NoConnectionWidget extends StatelessWidget {
  final Function() onTap;

  const NoConnectionWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/no-wifi.png',
              fit: BoxFit.contain,
              width: getWidthInPercent(context, 60),
            )),
        Column(
          children: [
            TextWidget(
                text: 'No Connection',
                color: Colors.black.withOpacity(0.5),
                fontSize: getSp(context, 15),
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxline: 2),
            TextWidget(
                text: 'Try again',
                color: Colors.black.withOpacity(0.5),
                fontSize: getSp(context, 15),
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxline: 2),
          ],
        ),
        Expanded(
            flex: 1,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ButtonWidget(
                    onTap: onTap,
                    text: TextWidget(
                        text: 'Try Again',
                        color: AppColors.white,
                        fontSize: getSp(context, 15),
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        maxline: 2),
                    width: double.infinity,
                    height: 50),
              ),
            ]))
      ],
    );
  }
}
