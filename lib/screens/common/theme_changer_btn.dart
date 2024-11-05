// ignore_for_file: prefer_const_constructors

import 'package:bmi_cal_new/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class ThemeChangerBtn extends StatelessWidget {
  const ThemeChangerBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  themeController.ChangeTheme();
                },
                icon: Icon(Icons.sunny),
                color: themeController.isDarkMode.value
                    ? Theme.of(context).colorScheme.onSecondaryContainer
                    : Theme.of(context).colorScheme.primary,
              ),
              IconButton(
                onPressed: () {
                  themeController.ChangeTheme();
                },
                icon: Icon(Icons.dark_mode),
                color: themeController.isDarkMode.value
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
