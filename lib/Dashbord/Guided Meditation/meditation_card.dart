import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MeditationCard extends StatelessWidget {
  MeditationCard({Key? key, this.title, this.imagePath, this.onTap})
      : super(key: key);

  VoidCallback? onTap;
  String? imagePath;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: PhysicalModel(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 150,
              width: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    color: Colors.green[200],
                    child: Image.asset(
                      imagePath!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    width: 120,
                    child: Container(
                      color: Colors.black54,
                      height: 30,
                      child: title!.text.white.makeCentered(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ).onTap(onTap!),
    );
  }
}
