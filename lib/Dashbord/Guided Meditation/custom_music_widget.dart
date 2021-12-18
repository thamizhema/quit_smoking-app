import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomMusicWidget extends StatefulWidget {
  CustomMusicWidget(
      {Key? key,
      this.musicPath,
      this.audioPlayer,
      this.title = 'Title',
      this.imagePath = 'images/music.jpg'})
      : super(key: key);
  String? musicPath;
  AudioPlayer? audioPlayer;
  String title;
  String imagePath;

  @override
  _CustomMusicWidgetState createState() => _CustomMusicWidgetState();
}

class _CustomMusicWidgetState extends State<CustomMusicWidget> {
  // late AudioPlayer audioPlayer;

  late AudioCache cache;

  double volume = 0.5;

  Widget volumeController() {
    return Slider.adaptive(
        activeColor: OurColors.mainColor,
        inactiveColor: Colors.grey[350],
        value: volume,
        onChanged: (value) {
          setState(() {
            volume = value;
            widget.audioPlayer!.setVolume(value);
          });
        });
  }

  bool isPlay = false;

  @override
  void initState() {
    super.initState();
    cache = AudioCache(fixedPlayer: widget.audioPlayer);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isPlay ? Colors.grey[300] : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(top: 10),
      width: context.screenWidth / 4,
      height: context.screenWidth / 3 + 30,
      child: Stack(
        alignment: Alignment.topCenter,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 75,
              width: 75,
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.contain,
              ),
              color: Colors.white,
            ).onInkTap(() {
              if (isPlay) {
                widget.audioPlayer!.stop();
              } else {
                cache.loop(widget.musicPath!);
              }
              setState(() {
                isPlay = !isPlay;
              });
            }),
          ).positioned(top: 0),
          widget.title.text.bold.gray500.makeCentered().positioned(bottom: 35),
          volumeController().positioned(bottom: 0, width: 110),
        ],
      ),
    );
  }
}
