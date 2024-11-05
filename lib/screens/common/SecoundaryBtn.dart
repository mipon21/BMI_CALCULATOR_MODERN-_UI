// ignore_for_file: deprecated_member_use, sort_child_properties_last

import 'package:bmi_cal_new/controller/BmiController.dart';
import 'package:bmi_cal_new/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Secoundarybtn extends StatelessWidget {
  final String btnName;
  final VoidCallback onPressed;

  const Secoundarybtn(
      {super.key, required this.btnName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Bmicontroller bmicontroller = Get.put(Bmicontroller());
    ThemeController themecontroler = Get.put(ThemeController());
    return InkWell(
        onTap: onPressed,
        child: Obx(
          () => Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                btnName.text
                    .letterSpacing(1.5)
                    .bold
                    .color(
                      bmicontroller.heightUnit.value == btnName
                          ? Colors.white
                          : Colors.black,
                    )
                    .make()
              ],
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: [
                  themecontroler.isDarkMode.value
                      ? BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      : BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                ],
                color: bmicontroller.heightUnit.value == btnName
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white,
                borderRadius: BorderRadius.circular(10)),
          ),
        ));
  }
}
