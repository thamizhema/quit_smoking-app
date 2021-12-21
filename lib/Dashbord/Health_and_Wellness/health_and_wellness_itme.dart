import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HealthAndWellnessItem extends StatelessWidget {
  HealthAndWellnessItem({Key? key, this.imagePath, this.title, this.onPressed})
      : super(key: key);
  String? imagePath;
  String? title;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          PhysicalModel(
            color: Colors.green,
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: context.screenWidth / 2.5,
                color: Colors.yellow,
                width: context.screenWidth / 3.5,
                child: Image.asset(
                  '$imagePath',
                  fit: BoxFit.cover,
                ),
              ).onInkTap(onPressed!),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          '$title'.text.make(),
        ],
      ),
    );
  }
}
