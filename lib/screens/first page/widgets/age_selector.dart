
// ignore_for_file: prefer_const_constructors

import 'package:bmi_cal_new/controller/BmiController.dart';
import 'package:bmi_cal_new/screens/common/rectangle_mini_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

class AgeSelector extends StatelessWidget {
  const AgeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Bmicontroller bmiController = Get.put(Bmicontroller());
    return Container(
      
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          "Age".text.color(Theme.of(context).colorScheme.onSecondaryContainer).make(),
          Obx(() => "${bmiController.Age.value}".text.size(55).bold.make()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RectangleMiniButton(
                icon: Iconsax.add,
                onTap: () {
                  bmiController.Age.value++;
                },
              ),
              RectangleMiniButton(
                icon: Iconsax.minus,
                onTap: () {
                  bmiController.Age.value--;
                },
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

