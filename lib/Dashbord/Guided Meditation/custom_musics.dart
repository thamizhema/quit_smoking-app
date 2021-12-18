import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quit_smoking/Dashbord/Guided%20Meditation/custom_music_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomMusics extends StatefulWidget {
  @override
  State<CustomMusics> createState() => _CustomMusicsState();
}

class _CustomMusicsState extends State<CustomMusics> {
  AudioPlayer happyMusic = AudioPlayer();
  AudioPlayer focusMusic = AudioPlayer();
  List<AudioPlayer> players = [
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
  ];
  List<String> musics = [
    'sounds/bird1.wav',
    'sounds/bird2.wav',
    'sounds/jungle1.wav',
    'sounds/jungle2.wav',
    'sounds/rain1.wav',
    'sounds/rain2.wav',
  ];
  List<String> audioTitle = [
    "Birds",
    "Birds",
    "Jungle",
    "Jungle",
    "Rain",
    "Rain"
  ];
  List<String> images = [
    "images/bird.png",
    "images/bird.png",
    "images/jungle.png",
    "images/jungle.png",
    "images/rain.jpg",
    "images/rain.jpg"
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for (AudioPlayer i in players) {
      i.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      width: context.screenWidth,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(
          players.length,
          (index) => CustomMusicWidget(
            audioPlayer: players[index],
            title: audioTitle[index],
            musicPath: musics[index],
            imagePath: images[index],
          ),
        ),
      ),
    );
  }
}
