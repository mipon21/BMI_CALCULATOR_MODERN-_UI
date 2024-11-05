// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, sort_child_properties_last, unnecessary_new, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:bmi_cal_new/controller/BmiController.dart';
import 'package:bmi_cal_new/screens/common/RactBtn.dart';
import 'package:bmi_cal_new/screens/common/rectangle_mini_btn.dart';
import 'package:bmi_cal_new/screens/common/theme_changer_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    Bmicontroller bmicontroller = Get.put(Bmicontroller());
    var percentageValue = bmicontroller.BMI.value / 100;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RectangleMiniButton(
                      width: 40,
                      height: 40,
                      borderRadius: 100,
                      icon: Icons.arrow_back_ios_new_outlined,
                      onTap: () {
                        Get.back();
                        bmicontroller.Height.value = 120; // Reset Height here
                      },
                    ),
                    ThemeChangerBtn(),
                    SizedBox(width: 40),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Obx(() => "Hlw ${bmicontroller.name.value},"
                        .text
                        .color(bmicontroller.colorStatus.value)
                        .xl3
                        .make())
                  ],
                ),
                Row(
                  children: [
                    Obx(() => "Your BMI is"
                        .text
                        .color(bmicontroller.colorStatus.value)
                        .xl5
                        .make())
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Obx(() => CircularPercentIndicator(
                            footer: Text(
                              "${bmicontroller.BMIStaus.value}",
                              style: TextStyle(
                                fontSize: 24.0,
                                color: bmicontroller.colorStatus.value,
                              ),
                            ),
                            radius: 100.0,
                            lineWidth: 20.0,
                            animation: true,
                            circularStrokeCap: CircularStrokeCap.round,
                            percent: bmicontroller.BMI.value / 100,
                            center: Text(
                              "${bmicontroller.BMI.value.toStringAsFixed(1)}%",
                              style: TextStyle(
                                fontSize: 34.0,
                                color: bmicontroller.colorStatus.value,
                              ),
                            ),
                            progressColor: bmicontroller.colorStatus.value,
                            backgroundColor: bmicontroller.colorStatus.value
                                .withOpacity(0.2),
                          )),
                    ),
                    Expanded(
                      child: Image.asset(
                        height: 400,
                        bmicontroller.getImagePath(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child:
                              "Your BMI is ${bmicontroller.BMI.value.toStringAsFixed(1)}, indicating your weight is in the “${bmicontroller.BMIStaus.value}” category for your height. For your height, a normal weight range would be from 53.3 to 72 KG. Maintain a healthy weight may reduce the risk of chronic diseases. Wish you a Good Health!"
                                  .text
                                  .xl
                                  .bold
                                  .make(),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyRactBtn(
                    onPressed: () {
                      bmicontroller.Gender.value = "Male";
                      bmicontroller.Height.value = 120; // Reset Height here
                      Get.back();
                    },
                    icon: Icons.arrow_back_ios_new_outlined,
                    btnName: "Find Out More!"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
