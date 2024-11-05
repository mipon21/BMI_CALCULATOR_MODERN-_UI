// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyRactBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String btnName;
  const MyRactBtn({super.key, required this.onPressed, required this.icon, required this.btnName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            btnName.text
                .letterSpacing(1.5)
                .xl
                .bold
                .color(
                  Colors.white,
                )
                .make()
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
