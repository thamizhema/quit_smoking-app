import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

class RandomCards extends StatelessWidget {
  RandomCards(
      {Key? key,
      this.imageList,
      this.pageController,
      this.storageKey,
      this.setIndexValueForSession})
      : super(key: key);
  final getStorage = GetStorage();
  List? imageList;
  PageController? pageController;
  String? storageKey;
  VoidCallback? setIndexValueForSession;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (value) {
                getStorage.write('$storageKey', value);
                setIndexValueForSession!();
              },
              children: List.generate(
                imageList!.length,
                (index) => imageCard(
                  imagePath: imageList![index],
                ),
              ),
            ),
            Positioned(
              // top: 20,
              bottom: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: Colors.black26,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class imageCard extends StatelessWidget {
  imageCard({
    Key? key,
    this.imagePath,
  }) : super(key: key);
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      color: Colors.red,
      child: Image.asset(
        '$imagePath',
        fit: BoxFit.cover,
      ),
    );
  }
}
