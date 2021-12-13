import 'package:flutter/material.dart';
import 'package:quit_smoking/Common/explore_button.dart';
import 'package:velocity_x/velocity_x.dart';

class QuitBot extends StatelessWidget {
  QuitBot({Key? key}) : super(key: key);

  String quitBot =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      color: Colors.grey[200],
      child: Column(
        children: [
          'Quit Couch'.text.makeCentered(),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    child: quitBot.text.justify.size(5).make().px12()),
              ),
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/robot 2.gif',
                      fit: BoxFit.cover,
                    )).box.height(120).shadow.rounded.make(),
              )
            ],
          ),
          const SizedBox(height: 15),
          ExploreButton(
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
