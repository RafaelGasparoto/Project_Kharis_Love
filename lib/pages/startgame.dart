import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StartGame extends StatefulWidget {
  @override
  State<StartGame> createState() => _StartGame();
}

class _StartGame extends State<StartGame> {
  List<String> txt = [];
  List<String> imgs = ["assets/images/eu.png", "assets/images/os2final.png"];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 10,
        child: Container(
          child: _getImg(),
          color: const Color(0xFFE04BCC),
        ),
      ),
      Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      flex: 6,
                      child: Align(
                        alignment: Alignment.center,
                        child: _getWidget(),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: _getButton()))),
                  ],
                ),
              ],
            ),
            color: Color(0xFFF6B1F0),
          ))
    ]);
  }
  _getImg(){
    if(index != 17 && index != 19){
      return _img(imgs[0]);
    }
    else if(index == 17 || index == 19){
      return _img(imgs[1]);
    }
}
  _getButton() {
    if (index <= 15) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFE04BCC),
        ),
        onPressed: () {
          setState(() {
            index++;
          });
        },
        child: null,
      );
    } else if (index < 17) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFE04BCC),
        ),
        onPressed: () {
          setState(() {});
        },
        child: null,
      );
    }
    else if (index == 17) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFE04BCC),
        ),
        onPressed: () {
          setState(() {index = 19;});
        },
        child: null,
      );
    }
   else if(index == 18){
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFE04BCC),
        ),
        onPressed: () {
          setState(() {index = 16;});
        },
        child: null,
      );
    }
  }

  _getWidget() {
    if (index <= 15) {
      return _txt(txt[index]);
    } else if (index == 16) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE04BCC),
              ),
              onPressed: () {
                setState(() {
                  index++;
                });
              },
              child: const Text("Sim")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE04BCC),
              ),
              onPressed: () {
                setState(() {
                  index=18;
                });
              },
              child: const Text(
                "Não",
              ))
        ],
      );
    } else if (index == 17) {
      return _txt("Parabéns, agora Kharis e Rafael são namorados!!!");
    }
    else if(index == 18){
      return _txt("Error esse final não é possivel de acontecer, por favor pense novamente.");
    }else if(index == 19){
      return _txt("Continua...");
    }

  }

  _txt(txt) {
    return Text(
      txt,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 13,
        color: Colors.black,
        decoration: TextDecoration.none,
      ),
    );
  }

  _img(String txt) {
    return Image.asset(
      txt,
      fit: BoxFit.fitWidth,
    );
  }
}
