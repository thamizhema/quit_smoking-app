import 'package:flutter/material.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Common/textfield.dart';
import 'package:velocity_x/velocity_x.dart';

class EmailLogin extends StatefulWidget {
  EmailLogin({Key? key}) : super(key: key);

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  FocusNode emailNode = FocusNode();
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  focusNode: emailNode,
                  controller: _editingController,
                )),
            Container(
              child: TextButton(
                child: Text('test'),
                onPressed: () {
                  setState(() {
                    emailNode.unfocus();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
