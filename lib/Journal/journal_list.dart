import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class JournalList extends StatelessWidget {
  JournalList({Key? key, this.title = 'title', this.notes, this.onPressed})
      : super(key: key);
  String title;
  List? notes;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        child: ListTile(
          title: Text(title).text.white.make(),
          leading: const Icon(
            Icons.book,
            color: Colors.white,
          ),
          onTap: onPressed,
          tileColor: OurColors.mainColor,
        ),
      ),
    );
  }
}
