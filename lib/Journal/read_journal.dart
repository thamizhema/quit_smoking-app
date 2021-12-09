import 'package:flutter/material.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ReadJournal extends StatelessWidget {
  ReadJournal({
    Key? key,
    this.memory,
    this.title1 = 'I am grateful for',
    this.title2 = 'Who will I uplift this Day and how will I do so',
    this.title3 = 'How can i improve the environment this Day',
  }) : super(key: key);
  List? memory;
  String title1;
  String title2;
  String title3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Read Journal'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              title1.text.underline.center.color(Colors.grey).makeCentered(),
              memory![0].length == 0
                  ? "-".text.makeCentered()
                  : memory![0].toString().text.xl2.makeCentered(),
              title2.text.underline.center.color(Colors.grey).makeCentered(),
              memory![1].length == 0
                  ? "-".text.makeCentered()
                  : memory![1].toString().text.xl2.makeCentered(),
              title3.text.underline.center.color(Colors.grey).makeCentered(),
              memory![2].length == 0
                  ? "-".text.makeCentered()
                  : memory![2].toString().text.xl2.makeCentered(),
            ],
          ),
        ),
      ),
    );
  }
}
