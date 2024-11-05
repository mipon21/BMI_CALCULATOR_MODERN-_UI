// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bmi_cal_new/screens/common/rectangle_mini_btn.dart';
import 'package:bmi_cal_new/screens/common/theme_changer_btn.dart';
import 'package:bmi_cal_new/screens/first%20page/widgets/age_selector.dart';
import 'package:bmi_cal_new/screens/first%20page/widgets/promo_slider.dart';
import 'package:bmi_cal_new/screens/first%20page/widgets/weight_selector.dart';
import 'package:bmi_cal_new/screens/secound%20page/secound_page.dart';
import 'package:bmi_cal_new/controller/BmiController.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    Bmicontroller bmicontroller = Get.put(Bmicontroller());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Prevents the UI from shrinking
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThemeChangerBtn(),
              "Welcome to"
                  .text
                  .color(Theme.of(context).colorScheme.onSecondaryContainer)
                  .xl
                  .make(),
              "EASY BMI"
                  .text
                  .color(Theme.of(context).colorScheme.onSurface)
                  .xl4
                  .bold
                  .make(),
              SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        bmicontroller.name.value = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                        labelText: "Name",
                        prefixIcon: Icon(Iconsax.user),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Expanded(child: WeightSelector()),
                          SizedBox(height: 20),
                          Expanded(child: AgeSelector()),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: ImageSlider(
                        imageUrls: [
                          "assets/images/men_chart/under_weight_image.png",
                          "assets/images/women_chart/under_weight_women_image.png",
                          "assets/images/men_chart/normal_weight_image.png",
                          "assets/images/women_chart/normal_weight_women_image.png",
                          "assets/images/men_chart/over_weight_image.png",
                          "assets/images/women_chart/over_weight_women_image.png",
                          "assets/images/men_chart/obese_weight_image.png",
                          "assets/images/women_chart/obese_weight_women_image.png",
                          "assets/images/men_chart/ext_obese_weight_image.png",
                          "assets/images/women_chart/ext_obese_weight_women_image.png",
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatedBox(
                    quarterTurns: 2,
                    child: RectangleMiniButton(
                      width: 80,
                      height: 80,
                      borderRadius: 100,
                      iconSize: 30,
                      icon: Icons.arrow_back_ios_new_outlined,
                      onTap: () => Get.to(SecoundPage()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
