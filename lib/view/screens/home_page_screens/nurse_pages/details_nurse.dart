import 'package:e_nurse_jobs/view/widget/safe_area_widget.dart';
import 'package:flutter/material.dart';

class DetailsNursePge extends StatelessWidget {
  const DetailsNursePge({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
          ],
        ),
      ),
    );
  }
}
