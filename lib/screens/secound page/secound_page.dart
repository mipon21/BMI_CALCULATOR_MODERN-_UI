// ignore_for_file: prefer_const_constructors

import 'package:bmi_cal_new/controller/BmiController.dart';
import 'package:bmi_cal_new/screens/common/PrimaryBtn.dart';
import 'package:bmi_cal_new/screens/common/RactBtn.dart';
import 'package:bmi_cal_new/screens/common/SecoundaryBtn.dart';
import 'package:bmi_cal_new/screens/common/rectangle_mini_btn.dart';
import 'package:bmi_cal_new/screens/common/theme_changer_btn.dart';
import 'package:bmi_cal_new/screens/result%20page/result_page.dart';
import 'package:bmi_cal_new/screens/secound%20page/widgets/HeightSelector.dart';
import 'package:bmi_cal_new/screens/secound%20page/widgets/HeightSelector_feet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SecoundPage extends StatefulWidget {
  const SecoundPage({super.key});

  @override
  State<SecoundPage> createState() => _SecoundPageState();
}

class _SecoundPageState extends State<SecoundPage> {
  @override
  Widget build(BuildContext context) {
    Bmicontroller bmicontroller = Get.put(Bmicontroller());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Side padding
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RectangleMiniButton(
                      width: 40,
                      height: 40,
                      borderRadius: 100,
                      icon: Icons.arrow_back_ios_new_outlined,
                      onTap: () => Get.back(),
                    ),
                    ThemeChangerBtn(),
                    SizedBox(width: 40),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryBtn(
                    btnName: "Male",
                    icon: Iconsax.man,
                    onPressed: () {
                      bmicontroller.Gender.value = "Male";
                    },
                  ),
                  SizedBox(width: 20),
                  PrimaryBtn(
                    btnName: "Female",
                    icon: Iconsax.woman,
                    onPressed: () {
                      bmicontroller.Gender.value = "Female";
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            bmicontroller.heightUnit.value == "CM"
                                ? HeightSelector() // CM height selector
                                : HeightSelectorFeet(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Secoundarybtn(
                                    onPressed: () {
                                      setState(() {});
                                      bmicontroller.heightUnit.value = "CM";
                                    },
                                    btnName: "CM",
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Secoundarybtn(
                                    onPressed: () {
                                      setState(() {});
                                      bmicontroller.heightUnit.value = "FT";
                                      bmicontroller.Height.value = 120.0;
                                    },
                                    btnName: "FT",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Obx(
                        () => SizedBox(
                          height: double.infinity, // Full height
                          child: Image.asset(
                            bmicontroller.Gender.value == "Male"
                                ? "assets/images/gender_men.png"
                                : "assets/images/gender_women.png",
                            fit: BoxFit.cover, // Fill the container
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              MyRactBtn(
                  onPressed: () {
                    bmicontroller.CalculateBMI();
                    Get.to(ResultPage());
                  },
                  icon: Iconsax.calculator,
                  btnName: 'Calculate'),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
