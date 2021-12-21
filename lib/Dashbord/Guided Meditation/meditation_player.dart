import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class MeditationPlayer extends StatefulWidget {
  MeditationPlayer(
      {this.typeOfMeditation, this.title, this.musicPath, this.imagePath});

  String? typeOfMeditation;
  String? title;
  String? musicPath;
  String? imagePath;

  @override
  _MeditationPlayerState createState() => _MeditationPlayerState();
}

class _MeditationPlayerState extends State<MeditationPlayer> {
  //we will need some variables
  bool playing = false; // at the begining we are not playing any song
  IconData playBtn = Icons.play_arrow; // the main state of the play button icon

  //Now let's start by creating our music player
  //first let's declare some object
  AudioPlayer? _player;
  AudioCache? cache;

  Duration position = Duration();
  Duration musicLength = Duration();

  //we will create a custom slider

  Widget slider() {
    return SizedBox(
      width: context.screenWidth / 1.6,
      child: Slider.adaptive(
          activeColor: OurColors.mainColor,
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player!.seek(newPos);
  }

  //Now let's initialize our player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //now let's handle the audioplayer time

    //this function will allow you to get the music duration
    _player!.onDurationChanged.listen((Duration d) {
      setState(() {
        musicLength = d;
      });
    });

    //this function will allow us to move the cursor of the slider while we are playing the song
    _player!.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _player!.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //let's start by creating the main UI of the app
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                OurColors.mainColor,
                Color(0xffcbf7c7),
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 48.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Let's add some text title
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "Guided Meditation",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "${widget.typeOfMeditation} Meditation",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              //Let's add the music cover
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Container(
                    color: Colors.yellow,
                    width: 280.0,
                    height: 280.0,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(50.0),
                    //     image: const DecorationImage(
                    //       image: AssetImage("images/focus.png"),
                    //     )),
                    child: Image.asset(
                      "${widget.imagePath}",
                      fit: BoxFit.cover,
                      // alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 18.0,
              ),
              Center(
                child: Text(
                  "${widget.title}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Spacer(),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Let's start by adding the controller
                    //let's add the time indicator text

                    SizedBox(
                      width: context.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          slider(),
                          Text(
                            "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // IconButton(
                        //   iconSize: 45.0,
                        //   color: OurColors.mainColor,
                        //   onPressed: () {},
                        //   icon: const Icon(
                        //     Icons.skip_previous,
                        //   ),
                        // ),
                        IconButton(
                          iconSize: 62.0,
                          color: OurColors.mainColor,
                          onPressed: () {
                            //here we will add the functionality of the play button
                            if (!playing) {
                              //now let's play the song
                              cache!.loop("${widget.musicPath}");
                              setState(() {
                                playBtn = Icons.pause;
                                playing = true;
                              });
                            } else {
                              _player!.pause();
                              setState(() {
                                playBtn = Icons.play_arrow;
                                playing = false;
                              });
                            }
                          },
                          icon: Icon(
                            playBtn,
                          ),
                        ),
                        // IconButton(
                        //   iconSize: 45.0,
                        //   color: OurColors.mainColor,
                        //   onPressed: () {},
                        //   icon: const Icon(
                        //     Icons.skip_next,
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
