import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MaterialApp(
    home: RiveApp(),
  ));
}

class RiveApp extends StatefulWidget {
  const RiveApp({Key? key}) : super(key: key);

  @override
  _RiveAppState createState() => _RiveAppState();
}

class _RiveAppState extends State<RiveApp> {
  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<bool>? isPlay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.load('images/box.riv').then((data) async {
      final file = RiveFile.import(data);
      print('data =====================');
      print(file);
      final artboard = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(artboard, 'breathe');
      if (controller != null) {
        artboard.addController(controller);
        isPlay = controller.findInput('start');
        setState(() => _riveArtboard = artboard);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _riveArtboard == null
              ? SizedBox()
              : Container(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Rive(
                      alignment: Alignment.center,
                      artboard: _riveArtboard!,
                    ),
                  ),
                ),
          TextButton(
              onPressed: () {
                setState(() {
                  isPlay?.value = !isPlay!.value;
                });
              },
              child: Text('ddd'))
        ],
      ),
    );
  }
}
