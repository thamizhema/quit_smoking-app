import 'package:flutter/material.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Support/purchase_button.dart';
import 'package:quit_smoking/Support/quit_bot.dart';
import 'package:quit_smoking/Support/quit_experts.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}



class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              QuitBot(),
              const SizedBox(height: 20),
              QuitExperts(),
              const SizedBox(height: 20),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: PurchaseButton(
                  buttonColor: OurColors.fbButtonColor,
                  buttonName: 'Join our Facebook Community',
                  isOutlineButton: false,
                  onPressed: () async {
                    await launch(
                      'www.facebook.com',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
