import 'package:e_nurse_jobs/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../../utils.dart/app_colors.dart';

class DetailsWidget extends StatelessWidget {
  final String text1, text2;
  final double height;
  final bool isImage;
  const DetailsWidget({
    Key? key,
    required this.text1,
    required this.text2,
    this.height = 50,
    this.isImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: height,
            decoration:
                BoxDecoration(border: Border.all(color: AppColors.secondary)),
            child: Center(
              child: TextWidget(
                  text: text1,
                  color: AppColors.primaryDark,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  maxline: 2),
            ),
          ),
        ),
        ///////////
        Expanded(
          child: Container(
            height: height,
            padding: const EdgeInsets.all(5),
            decoration:
                BoxDecoration(border: Border.all(color: AppColors.secondary)),
            child: Center(
              child: isImage
                  ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(text2,fit: BoxFit.contain,),
                  )
                  : TextWidget(
                      text: text2,
                      color: AppColors.primaryLight,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxline: 6),
            ),
          ),
        ),
      ],
    );
  }
}
