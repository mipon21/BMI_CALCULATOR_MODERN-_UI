
// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:bmi_cal_new/controller/BmiController.dart';
import 'package:bmi_cal_new/screens/common/rectangle_mini_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';

class WeightSelector extends StatelessWidget {
  const WeightSelector({
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
          "Weight (KG)".text.color(Theme.of(context).colorScheme.onSecondaryContainer).make(),
          Obx(() => "${bmiController.Weight.value}".text.size(55).bold.make()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RectangleMiniButton(
                icon: Iconsax.add,
                onTap: () {
                  bmiController.Weight.value++;
                },
              ),
              RectangleMiniButton(
                icon: Iconsax.minus,
                onTap: () {
                  bmiController.Weight.value--;
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

