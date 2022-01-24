import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:project_kharis_love/pages/home_page.dart';
import 'package:just_audio/just_audio.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.loopMode;
  }
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  _tocar() async{
    await player.setAsset("assets/audio/music.mp3");
    await player.setLoopMode(LoopMode.one);
    player.play();
  }

  Widget build(BuildContext context) {
    _tocar();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(player),
    );
  }
}
