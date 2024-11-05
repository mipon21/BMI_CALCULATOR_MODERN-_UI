// ignore_for_file: deprecated_member_use, sort_child_properties_last

import 'package:bmi_cal_new/controller/BmiController.dart';
import 'package:bmi_cal_new/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class PrimaryBtn extends StatelessWidget {
  final IconData icon;
  final String btnName;
  final VoidCallback onPressed;

  const PrimaryBtn(
      {super.key,
      required this.icon,
      required this.btnName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Bmicontroller bmicontroller = Get.put(Bmicontroller());
    ThemeController themecontroler = Get.put(ThemeController());
    return Expanded(
      child: InkWell(
          onTap: onPressed,
          child: Obx(
            () => Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: bmicontroller.Gender.value == btnName
                      ? Colors.white
                      : Colors.black,
                  ),

                  btnName.text
                      .letterSpacing(1.5)
                      .xl
                      .bold
                      .color(bmicontroller.Gender.value == btnName
                      ? Colors.white
                      : Colors.black,)
                      .make()
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: !context.isMobile ? BoxDecoration(
                  boxShadow: [
                    themecontroler.isDarkMode.value ?
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ) : BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                  color: bmicontroller.Gender.value == btnName
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10)) : BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: bmicontroller.Gender.value == btnName
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10))
            ),
          )),
    );
  }
}
