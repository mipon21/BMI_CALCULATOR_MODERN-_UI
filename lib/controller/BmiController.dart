// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bmicontroller extends GetxController {
  RxString Gender = "Male".obs;  // Default value set to "Male"
  RxString heightUnit = "CM".obs;
  RxString name = "There".obs;

  RxInt Weight = 45.obs;
  RxInt Age = 18.obs;
  RxDouble Feet = 5.0.obs;
  RxDouble Ince = 5.0.obs;
  RxDouble Height = 120.0.obs;
  RxDouble BMI = 0.0.obs;
  RxString BMIStaus = "".obs;
  Rx<Color> colorStatus = Color(0xff246AFE).obs;


  void genderHandle(String gender) {
    Gender.value = gender;
  }

  void lenghtHandle(String length) {
    heightUnit.value = length;
  }

  void CalculateBMI() {
    if (Height.value > 120) {
      var HeightInMeters = Height.value / 100;
      BMI.value = Weight.value / (HeightInMeters * HeightInMeters);
    } else {
      var totalCm = Feet.value * 30.48 + Ince.value * 2.54;
      var HeightInMeters = totalCm / 100.0;
      BMI.value = Weight.value / (HeightInMeters * HeightInMeters);
    }
    FindStatus();
  }

  void FindStatus() {
    if (BMI.value < 18.5) {
      BMIStaus.value = "UnderWeight";
      colorStatus.value = Color(0xff00A5A9);
    } else if (BMI.value >= 18.5 && BMI.value <= 24.9) {
      BMIStaus.value = "Normal";
      colorStatus.value = Color(0xff1C9A00);
    } else if (BMI.value >= 25 && BMI.value <= 29.9) {
      BMIStaus.value = "OverWeight";
      colorStatus.value = Color(0xffEDB000);
    } else if (BMI.value >= 30 && BMI.value <= 39.9) {
      BMIStaus.value = "Obese";
      colorStatus.value = Color(0xffFE6700);
    } else {
      BMIStaus.value = "Extremely Obese";
      colorStatus.value = Color(0xffE3271C);
    }
  }
  String getImagePath() {
    if (Gender.value == "Male") {
      return BMIStaus.value == "UnderWeight"
          ? "assets/images/men_chart/under_weight_image.png"
          : BMIStaus.value == "Normal"
              ? "assets/images/men_chart/normal_weight_image.png"
              : BMIStaus.value == "OverWeight"
                  ? "assets/images/men_chart/over_weight_image.png"
                  : BMIStaus.value == "Obese"
                      ? "assets/images/men_chart/obese_weight_image.png"
                      : "assets/images/men_chart/ext_obese_weight_image.png";
    } else if (Gender.value == "Female") {
      return BMIStaus.value == "UnderWeight"
          ? "assets/images/women_chart/under_weight_women_image.png"
          : BMIStaus.value == "Normal"
              ? "assets/images/women_chart/normal_weight_women_image.png"
              : BMIStaus.value == "OverWeight"
                  ? "assets/images/women_chart/over_weight_women_image.png"
                  : BMIStaus.value == "Obese"
                      ? "assets/images/women_chart/obese_weight_women_image.png"
                      : "assets/images/women_chart/ext_obese_weight_women_image.png";
    }
    return "assets/images/default_image.png"; // Default image if gender is not Male or Female
  }
}
