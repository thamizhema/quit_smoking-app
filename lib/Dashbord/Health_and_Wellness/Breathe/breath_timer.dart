import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:rive/rive.dart';
import 'package:velocity_x/velocity_x.dart';

class BreatheTimer extends StatefulWidget {
  const BreatheTimer({Key? key}) : super(key: key);

  @override
  _BreatheTimerState createState() => _BreatheTimerState();
}

class _BreatheTimerState extends State<BreatheTimer> {
  Artboard? _artboard;
  SMIInput<bool>? isPlay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.load('assets/animations/box_breathing.riv').then((data) async {
      final file = RiveFile.import(data);
      final board = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(board, 'breathe');
      if (controller != null) {
        board.addController(controller);
        isPlay = controller.findInput('start');
        setState(() {
          isPlay?.value = false;
          _artboard = board;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4FDFF),
      appBar: AppBar(
        backgroundColor: Color(0xff1F81AC),
        centerTitle: true,
        title: 'Breathe'.text.make(),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(),
          // '00:10'.text.xl2.coolGray400.makeCentered(),
          Center(
            child: _artboard == null
                ? const SizedBox()
                : Container(
                    width: context.screenWidth / 1,
                    height: context.screenWidth / 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                    ),
                    child: Rive(artboard: _artboard!),
                  ),
          ),
          // Center(
          //   child: Container(
          //     width: 150,
          //     height: 150,
          //     decoration: BoxDecoration(
          //       color: Color(0xffA8F9C9),
          //       borderRadius: BorderRadius.circular(300),
          //     ),
          //     child: '3'.text.xl6.color(OurColors.mainColor).makeCentered(),
          //   ),
          // ),

          // 'Breathe In'.text.xl2.coolGray400.makeCentered(),
          if (isPlay != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Material(
                color: Color(0xff1F81AC),
                child: Container(
                  height: 50,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isPlay!.value
                            ? FontAwesomeIcons.stop
                            : FontAwesomeIcons.play,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      (isPlay!.value ? "STOP" : "Play").text.white.xl2.make(),
                    ],
                  ).onInkTap(() {
                    setState(() {
                      isPlay!.value = !isPlay!.value;
                    });
                  }),
                ),
              ),
            )
        ],
      )),
    );
  }
}
