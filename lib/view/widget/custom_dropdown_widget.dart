import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_nurse_jobs/utils.dart/app_colors.dart';
import 'package:e_nurse_jobs/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

class CustomDropDownWidget extends StatelessWidget {
  final bool isOptional;
  final String labelText;
  final String hintText;
  final List<String> items;
  // ignore: prefer_typing_uninitialized_variables
  final String value;
  // ignore: prefer_typing_uninitialized_variables
  final onChange;
  const CustomDropDownWidget({
    Key? key,
    required this.hintText,
    required this.items,
    required this.labelText,
    this.isOptional = false,
    required this.onChange,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextWidget(
                text: labelText,
                color: AppColors.primaryDark,
                fontSize: 12,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
                maxline: 1),
            isOptional
                ? TextWidget(
                    text: '   (اختياري)',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                    maxline: 1)
                : TextWidget(
                    text: '*',
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                    maxline: 1),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        DropdownButtonFormField(
          isExpanded: true,
          validator: (value) {
            if (!isOptional) {
              if (value == '') {
                return 'You have to enter a value';
              }
            }

            return null;
          },
          hint: AutoSizeText(
            hintText,
            style: const TextStyle(color: AppColors.primaryLight, fontSize: 11),
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 30, top: 5, right: 5, bottom: 5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.primaryDark, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primaryDark, width: 2),
            ),
            filled: true,
            fillColor: AppColors.white,
          ),
          // Down Arrow Icon
          icon: const Icon(Icons.arrow_drop_down),
          iconEnabledColor: Colors.black,
          value: value,
          // Array list of items
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),

          onChanged: onChange,
          // (String? newValue) {
          //   print(newValue);
          //   // setState(() {
          //   //   dropdownvalue = newValue!;
          //   // });
          // },
        ),
      ],
    );
  }
}
