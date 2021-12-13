import 'package:flutter/material.dart';
import 'package:quit_smoking/Common/colors.dart';

import 'package:quit_smoking/Support/purchase_button.dart';

import 'package:velocity_x/velocity_x.dart';

class QuitExperts extends StatelessWidget {
  QuitExperts({Key? key}) : super(key: key);
  String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          "Consulting with Quit Experts".text.makeCentered(),
          const SizedBox(height: 10),
          description.text.justify.size(10).color(Colors.grey).makeCentered(),
          const SizedBox(height: 15),
          PurchaseButton(
            buttonColor: OurColors.mainColor,
            buttonName: '7 Day free trail, then ₹70.00 per week',
            isOutlineButton: true,
            onPressed: () {},
          ),
          const SizedBox(height: 10),
          PurchaseButton(
            buttonColor: OurColors.mainColor,
            buttonName: 'One Time Purchase : ₹300',
            isOutlineButton: false,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
