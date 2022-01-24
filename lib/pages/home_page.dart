import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project_kharis_love/utils/nav.dart';
import 'package:project_kharis_love/pages/startgame.dart';

class HomePage extends StatelessWidget {
  AudioPlayer player;

  HomePage(AudioPlayer this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(context) {
    Size size = MediaQuery.of(context).size;
    return Container(width: size.width, color: Colors.white, child: _tela(context));
  }

  _tela(context) {
    return Container(
      color: const Color(0xFFFFAEF4),
        child:
    Column(children: [
      Expanded(flex: 1,
          child: Container()),
      Expanded(
        flex: 10,
        child:
      Stack(
        children: [
          Align(alignment: Alignment.bottomCenter,
              child:
          _img("assets/images/os2.png")
          ),
            Align(
                alignment: Alignment.topCenter,
                child: _img("assets/images/logo2.png"),
              )
        ],
      ),),
      Expanded(
      flex: 1,
        child: Align(
            alignment: Alignment.center,
            child: ButtonTheme(
              child: _button_1(context),
            )),
      ),
      Expanded(
      flex: 1,
      child: Align(
            alignment: Alignment.center,
            child: ButtonTheme(
              child: _button_2(context),
            ),
          )
      )
      ]));
  }

  _button_1(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFE04BCC),
      ),
      onPressed: () => _onClickNavigator(context, StartGame()),
      child: const
          Text(
            "New game",
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
            ),
          ),
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
  }

  _button_2(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      primary: Color(0xFFE04BCC),
    ),
      child: const Text(
        "Quit",
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 20,
        ),
      ),
      onPressed: () => _onClick_2(),
    );
  }

  _onClick_2() async {
    await player.setAsset("assets/audio/music.mp3");
    if(!player.playing){
      player.play();
    }
  }
/*
  _button_3() {
    return ElevatedButton(
        child: const Text("Features",
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
            )),
        onPressed: () => _onClick_3());
  }

  _button_4() {
    return ElevatedButton(
        child: const Text("Quit",
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
            )),
        onPressed: () => _onClick_4());
  }
*/
  _img(String s) {
    return Image.asset(
      s,
    fit: BoxFit.fitWidth,
    );
  }

}
