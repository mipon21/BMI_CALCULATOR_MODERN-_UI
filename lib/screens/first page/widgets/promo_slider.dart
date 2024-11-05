// Import statements
import 'package:bmi_cal_new/controller/slider_controller.dart';
import 'package:bmi_cal_new/screens/common/circular_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imageUrls;

  const ImageSlider({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SliderController());
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded( // Wrap with Expanded to fill available height
      child: Column(
        children: [
          Expanded( // Ensure the CarouselSlider fills the available space
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: double.infinity,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  controller.updateCarouselIndex(index);
                },
              ),
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < imageUrls.length; i++)
                  MyCircularContainer(
                    width: 10,
                    height: 4,
                    margin: const EdgeInsets.only(right: 5),
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? isDark
                            ? Colors.black
                            : Colors.white
                        : Colors.grey,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
