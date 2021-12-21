import 'package:flutter/material.dart';
import 'package:quit_smoking/Dashbord/Health_and_Wellness/wisdoms.dart';

class AllHealthAndWellness extends StatelessWidget {
  AllHealthAndWellness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health And Wellness'),
      ),
      body: SafeArea(
        child: Wrap(
          children: List.generate(items.length, (index) {
            return items[index];
          }),
        ),
      ),
    );
  }
}
